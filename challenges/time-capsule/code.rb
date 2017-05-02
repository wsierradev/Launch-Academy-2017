#Greeting and name retrieval
print "Hello there! What's your name?\n>"
name = gets.chomp

puts "Hello #{name}!!!\n"

#Array creation and array input

print "#{name}, please add an item to the Time capsule.\n\nPlease enter the word FINISHED when you are done entering your items.\n>"
capsule = Array.new

while true
entry = gets.chomp
if entry == "finished"
  break
end
print "How many of that item would you like?\n>"
number = gets.chomp
entry = entry.to_s + " (#{number})"
  capsule << entry
  print "What else would you like?\n>"
end

#Display of Array

puts "\n#{name}, thanks for trying our Time Capsule maker. Here is a list of the items in your Time Capsule!:\n\n"

capsule.each do |item|
  puts " * #{item}\n"
end
