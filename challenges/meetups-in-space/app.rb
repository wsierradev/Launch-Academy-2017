require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/show/:name' do
  if current_user
    name = params[:name]
    Meetup.all.each do |meetup|
      if meetup.name == name
        @meetup = meetup
        @members = meetup.users
      end
    end
    erb :'meetups/show'
  else
    flash[:notice] = "You must be signed in"
    redirect '/meetups'
  end
end

get '/meetups/new' do
  if current_user
    erb :'meetups/new'
  else
    flash[:notice] = "You must be signed in"
    redirect '/meetups'
  end
end

post '/meetups/new' do
  name = params[:name]
  location = params[:location]
  description = params[:description]
  creator = current_user.username
  Meetup.create(name: name, location: location, description: description, creator: creator)
  flash[:notice] = "You created a meetup!"
  redirect "/meetups/show/#{name}"
end

post '/meetups/show/:name' do
  if params[:delete]
    Meetup.find_by(name: params[:name]).delete
    flash[:notice] = "You deleted your meetup"
    redirect '/meetups'
  elsif params[:join]
    meetup = Meetup.find_by(name: params[:name])
    unless Member.find_by(user: current_user)
      Member.create(user: current_user, meetup: meetup)
      flash[:notice] = "You joined this meetup"
    end
  elsif params[:leave]
    Member.find_by(user: current_user).delete
    flash[:notice] = "You left this meetup"
  end
  redirect "/meetups"
end
