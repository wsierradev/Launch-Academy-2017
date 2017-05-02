require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require_relative 'models/contact'
also_reload 'models/contact'

get '/' do
  redirect '/contacts'
  erb :index
end

get '/contacts' do
  @contacts = Contact.order(:last_name)
  erb :index
end

get '/contacts/:id' do
  @contacts = Contact.all

  @contacts.each do |contact|
    if contact.id == params[:id].to_i
      @id = params[:id]
      @name = contact.name
      @phone_number = contact.phone_number
    end
  end
  erb :show
end
