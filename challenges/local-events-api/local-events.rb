require 'net/http'
require 'json'
require 'uri'

url = "http://api.seatgeek.com/2/events?venue.city=Boston&venue.state=MA&datetime_local.gte=2015-12-09&datetime_local.lt=2015-12-10"&client_id=Njc1MDUyOHwxNDg2MDQwNjA0LjU2"
uri = URI(url)
response = Net::HTTP.get(uri)
JSON.parse(response)
