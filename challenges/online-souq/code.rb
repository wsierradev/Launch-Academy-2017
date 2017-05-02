# Array of items

items = ["old paperback book", "potato", "red onion", "dried lemon", "frankincense", "medicinal herbs", "saffron", "glass spice jar", "red fabric", "orange fabric", "handicraft"]

#Greeting and array display

puts "Hello shopper. What's your name?"
name = gets.chomp

puts "Hello #{name}!!!"

print "Please select an item from the below list.\n\nPlease enter the word FINISHED when you are done selecting your items.\n\n"
items.each do |item|
  puts " * #{item}"
end

#Creation of cart array and unavailable array

cart = Array.new
dont_have = Array.new

#While loop for item input and unavailable input

while true
entry = gets.chomp.downcase
if entry == "finished"
  break
end
  if items.include?(entry)
    cart << entry
  else
    dont_have << entry
    puts "Sorry we don't have that yet!"
end
end

#Display of cart and unavailable items

puts "\n#{name}, thanks for trying out our online souq platform. Here is a list of the items in your cart!:\n\n"

cart.each do |item|
  puts " * #{item}\n"
end

puts "\nWe noticed you entered some items that are currently not available. We're sorry but here's the list of missing items. We'll let you know if they show up later.:\n\n"

dont_have.each do |item|
  puts " * #{item}\n"
end
