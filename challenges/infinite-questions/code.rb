require 'pry'
input = nil
while input != "no" do
  puts "Can I get you anything?"
  print ">"
  input = gets.chomp
end

puts "Okay, bye!"
