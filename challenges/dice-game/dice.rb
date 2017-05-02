# YOUR CODE, HERE
#Also unsure how much leeway we have in these assignments so I try to keep them as close to the sample run as I can.

stop = nil

while stop != "s" or stop == nil
  dice_1 = rand(6) + 1
  dice_2 = rand(6) + 1
  total = dice_2 + dice_1
	  puts "You rolled a #{dice_1} and a #{dice_2}.\nTotal: #{total}\nPress 'Enter' to roll again, 's' to stop."
	stop = gets.chomp
	while stop != "s" and stop != ""
	  puts "Invalid choice. Try again."
	  stop = gets.chomp
	end
	end
