require 'sinatra'
require 'csv'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = CSV.readlines('articles.csv')
  erb :index
end

get '/articles/new' do
  erb :show
end

post '/articles/new' do
  title = params[:title]
  url = params[:url]
  description = params[:description]
  @error = ""

  unless title == "" || url == "" || description == ""
    CSV.open('articles.csv', 'a') do |csv|
      csv << [title, url, description]
    end
    else
      @error = "You missed something!!"
      redirect '/articles/new'
  end


  redirect '/articles'
end
