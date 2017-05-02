width = 8
length = 20
height = 8.0 / 12.0

cubic_feet =  width * length * height

if cubic_feet < 50
  total_cost = 20
elsif cubic_feet < 150
  total_cost = 50
elsif cubic_feet < 300
  total_cost = 100
elsif cubic_feet > 300
  total_cost = 150
end

puts "Cubic Feet: $#{cubic_feet.round(2)}"
puts "Quote Price: $#{total_cost}"
