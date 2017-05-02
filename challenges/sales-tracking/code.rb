# Your code, here.
puts "Enter your values here!"
total = 0
while total < 100 do
  print ">"
  input = gets.chomp.to_f
  total += input
end
puts "You've reached 100!!!"
