require "sinatra"
require "csv"
require "json"
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

def homepage
  <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title>grocery-list-js</title>
    </head>
    <body>
      <a href="SpecRunner.html">Jasmine Specs</a></br>
      <a href="/groceries">Grocery Page</a>
    </body>
    </html>
  HTML
end

CURRENT_FILE_PATH = File.dirname(__FILE__)

def parsed_groceries_json_data
  data = File.read(CURRENT_FILE_PATH + "/groceries.json")
  JSON.parse(data)
end

def update_groceries_json_data(groceries)
  data = { groceries: groceries }
  json_formatted_data = JSON.pretty_generate(data, indent: '  ')
  File.write(CURRENT_FILE_PATH + '/groceries.json', json_formatted_data)
end

get '/' do
  homepage
end

get "/groceries" do
  erb :groceries
end

get '/groceries.json' do
  status 200
  File.read(CURRENT_FILE_PATH + "/groceries.json")
end

post '/groceries.json' do
  parsed_data = JSON.parse(request.body.read)
  grocery_name = parsed_data["grocery"]["name"]
  grocery_quantity = parsed_data["grocery"]["quantity"]
  if !grocery_name.empty?
    grocery = {
      name: grocery_name,
      quantity: grocery_quantity
    }
    groceries = parsed_groceries_json_data["groceries"]
    groceries.push(grocery)
    update_groceries_json_data(groceries)

    status 201
    { grocery: grocery }.to_json
  else
    status 422
  end
end
