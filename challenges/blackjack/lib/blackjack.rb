
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

puts "Welcome to Blackjack!"

deck = Deck.new
players_hand = Hand.new
dealers_hand = Hand.new


def deal_card(deck, hand, name)
  card = deck.draw!
  hand.hit!(card)
  puts "#{name} was dealt #{card}"
end

2.times do
  deal_card(deck, players_hand, "Player")
end

deal_card(deck, dealers_hand, "Dealer")

def display_hand(hand, name)
  puts
  puts "#{name}'s Hand: #{hand}"
  puts "#{name}'s Score: #{hand.score}\n"
end

display_hand(players_hand, "Player")

print "Hit or stand (H/S): "
input = gets.chomp.upcase

while input != "S"
  if input == "H"
    deal_card(deck, players_hand, "Player")
    display_hand(players_hand, "Player")

    if players_hand.busted?
      puts "You lost! Crap!"
      exit
    end

  else
    puts "Nooope!! Try again."
  end

  print "Hit or stand (H/S): "
  input = gets.chomp.upcase
end

deal_card(deck, dealers_hand, "Dealer")
display_hand(dealers_hand, "Dealer")

while dealers_hand.score < 17
  deal_card(deck, dealers_hand, "Dealer")

  display_hand(dealers_hand, "Dealer")

  if dealers_hand.busted?
    puts "A winner is you!"
    exit
  end
end

if players_hand.score > dealers_hand.score
  if players_hand.score == 21
    puts "BUUUUHHHHLLLLAAAACKJAAACK!!!!!!"
  end
  puts "A winner is you!"
elsif dealers_hand.score > players_hand.score
  if dealers_hand.score == 21
    puts "BUUUUHHHHLLLLAAAACKJAAACK"
  end
  puts "You lost! Crap!"
else
  puts "Push"
end
