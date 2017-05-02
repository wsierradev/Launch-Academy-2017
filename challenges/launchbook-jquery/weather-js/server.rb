# A "Proxy API" for accessing DarkSky

require "sinatra"
require "net/http"

DARK_SKY_API_KEY = "YOUR-API-KEY-HERE"

get "/api/v1/forecast/:latitude,:longitude" do |latitude, longitude|
  uri = URI("https://api.darksky.net/forecast/#{DARK_SKY_API_KEY}/#{latitude},#{longitude}")
  return Net::HTTP.get(uri)
end
