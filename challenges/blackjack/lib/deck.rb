require_relative 'card'
class Deck
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS = ['♥', '♠', '♦', '♣']

  def initialize
    @cards = []

    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    @cards.shuffle!
  end

  def draw!
    @cards.pop
  end

  def count
    @cards.count
  end
end
