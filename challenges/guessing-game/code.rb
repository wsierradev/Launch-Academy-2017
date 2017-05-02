require 'pry'

print "Welcome to the Guessing Game! What difficulty would like to play?\n Type easy or hard:\n>"
easy_or_hard = gets.chomp
while easy_or_hard != "easy" and easy_or_hard != "hard"
  puts "Invalid input. Please try again."
  easy_or_hard = gets.chomp
end

	if easy_or_hard == "easy"
	  puts "I've picked a number between 1 and 10. Now guess it!"
	  answer = rand(10) + 1
	else
	  puts "I've picked a number between 1 and 20. Now guess it!"
	  answer = rand(20) + 1
	end
	  guess = gets.chomp
	score = 1
	while guess != answer.to_s
	  puts "Nope, try again!"
	  guess = gets.chomp
	  score += 1
	end

	puts "You win! Nice Job!!"
	puts "Your score is #{score}."
