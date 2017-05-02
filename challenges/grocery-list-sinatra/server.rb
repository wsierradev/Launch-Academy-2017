require 'sinatra'
require 'csv'

get "/" do
  redirect "/grocery-list"
end

get "grocery-list?" do
  redirect "grocery-list"
end

get "/grocery-list" do
  @list = CSV.readlines("grocery_list.csv", headers: true)
  erb :index
end

get "/error" do
  erb :error
end

post "/grocery-list" do
  @grocery_item = params[:grocery_item]
  @item_quantity = params[:item_quantity]
  @previous_quantity = ""
  if @item_quantity != ""
    @item_quantity = "(#{@item_quantity})"
  elsif @grocery_item == ""
    @previous_quantity = @item_quantity
    redirect "/grocery_list"
  end
  if @grocery_item.strip.empty?
    redirect "/error"
  else
    CSV.open("grocery_list.csv", "a") do |file|
      file.puts([@grocery_item, @item_quantity])
    end
  end
  redirect "/grocery-list"
end

get "/grocery-list/:grocery_item" do
  @grocery_item = params[:grocery_item]

  erb :show
end
