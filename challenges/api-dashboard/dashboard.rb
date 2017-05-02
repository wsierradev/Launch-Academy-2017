require "./lib/geolocation"
require "sinatra/base"
require "json"
require "net/http"
require 'pry'

require "dotenv"
Dotenv.load

def set_location
  @geolocation = Geolocation.new(@ip)
  @ip = request.ip
  @city = @geolocation.city
  @state = @geolocation.state
end

def get_news
  # nytkey = ENV["NYTIMES_API_KEY"]
  uri = URI("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=fba9a70052544194b69f532cf1aa2288")
  response = Net::HTTP.get_response(uri)
  @news = JSON.parse(response.body)["results"]
end

def get_weather
  set_location
  # wukey = ENV["WUNDERGROUND_API_KEY"]
  url = "http://api.wunderground.com/api/ecf722baca33892a/conditions/q/"
  url += "NJ"#"{@state}"
  url += "/#{@city}.json"
  uri = URI(url)
  response = Net::HTTP.get_response(uri)
  @temp_f = JSON.parse(response.body)["current_observation"]["temp_f"]
  @temp_c = JSON.parse(response.body)["current_observation"]["temp_c"]
end

# def get_events
#   set_location
#   city = @city
#   state = @state
#   today = Time.now.strftime("%Y-%m-%d")
#
#   url = "https://api.seatgeek.com/2/events?client_id=Njc1MDUyOHwxNDg2MDQwNjA0LjU2"
#   url += "?venue.city=#{city}"
#   url += "&datetime_local.gte=#{today}"
#
#   uri = URI(url)
#   response = Net::HTTP.get_response(uri)
#   @events = JSON.parse(response.body)["events"]
# end

class Dashboard < Sinatra::Base
  get("/") do
    get_weather
    get_news
    # get_events

    erb :dashboard
  end
end
