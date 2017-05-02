class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def is_ace?
    rank == "A"
  end

  def is_face_card?
    rank == "K" || rank == "Q" || rank == "J"
  end

  def to_s
    "#{rank}#{suit}"
  end
end
