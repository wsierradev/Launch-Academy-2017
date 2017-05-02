#This is the advanced dice game.
#Took me awhile to figure out how to block string inputs on this one.

print "How many sides does your dice have?\n>"
sides = gets.chomp
while sides.to_i <= 1
  print "Invalid entry. Please enter a valid number.\n>"
  sides = gets.chomp
end
	print "How many times would you like to roll your pair of dice?\n>"
	times = gets.chomp
	while times.to_i <= 0
	  print "Invalid entry. Please enter a valid number.\n>"
	  times = gets.chomp
	end
	stop = nil

	while stop != "n"
	  times.to_i.times do
	  dice_1 = rand(sides.to_i) + 1
	  dice_2 = rand(sides.to_i) + 1
    total = dice_1 + dice_2
	puts "You rolled a #{dice_1} and a #{dice_2}. Total: #{total} "

	end
	print "Roll again? [y/n]>"
	stop = gets.chomp
	while stop != "y" and stop != "n" do
	  print "Invalid choice. Try again.\n>"
	  stop = gets.chomp
	end
	end
