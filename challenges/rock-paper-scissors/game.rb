# YOUR CODE GOES HERE
computer = rand(3) + 1
if computer == 1
  computer = "rock"
elsif computer == 2
  computer = "paper"
elsif computer == 3
  computer = "scissors"
end

puts "Welcome challenger! Choose your weapon! Rock (r), Paper (p), or Scissors (s)!!!"
input = gets.chomp
if input == "r"
  input = "rock"
elsif input == "p"
  input = "paper"
elsif input == "s"
  input = "scissors"
end

if input == "rock" or input == "paper" or input == "scissors"
  puts "You chose #{input}."
  puts "Your opponent chose #{computer}."
  if input == "rock" &&  computer == "scissors" or input == "paper" && computer == "rock" or input == "scissors" && computer == "paper"
    puts "You win!! #{input} beats #{computer}."
  elsif computer == "rock" && input == "scissors" or computer == "paper" && input == "rock" or computer == "scissors" && input == "paper"
    puts "You lose. #{computer} beats #{input}."
  else
    puts "Tie!!!"
  end
  puts "Invalid weapon challenger. Try again."
end
