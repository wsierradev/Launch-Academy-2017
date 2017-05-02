knife_tip = 2.1
knife_tip2 = 0.77
knife_tip3 = 5
knife_tip4 = 1
knife_tip5 = 3
knife_total = knife_tip + knife_tip2 + knife_tip3 + knife_tip4 + knife_tip5
torch_tip = 6
torch_tip2 = 3.5
torch_tip3 = 7
torch_total = torch_tip + torch_tip2 + torch_tip3
hand_tip = 2
hand_tip2 = 1
hand_total = hand_tip + hand_tip2
human_tip = 0.75
human_tip2 = 0.43
human_total = human_tip + human_tip2
puts "Knife Juggling:"
puts knife_total.round(2)
puts "Torch Juggling:"
puts torch_total.round(2)
puts "Hand Balancing:"
puts hand_total.round(2)
puts "Human Blockhead:"
puts human_total.round(2)
puts
puts "Total:"
total = knife_total + torch_total + hand_total + human_total
puts total.round(2)
puts
puts "Average Tip Value:"
puts (total / 12).round(2)
puts
puts "Now with that business out of the way let's get on with the show! You there. Care for a bit of adventure? What's your name?"
name = gets.chomp
puts "Great name! I'd name my child that if I had one. Everybody lets give a round of applause for #{name}. Now #{name}, what's your favorite number?"
number = gets.chomp
puts "#{number}? Great minds think alike, I was just thinking of that number myself! Well #{name}, me and my buddy here will be juggling these knives around you for #{number} seconds. Remember, no sudden movements!!!"
