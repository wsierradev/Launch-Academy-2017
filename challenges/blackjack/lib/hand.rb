class Hand

  def initialize
    @cards = []
  end

  def hit!(card)
    @cards << card
  end

  def score
    total = 0
    has_ace = false

    @cards.each do |card|
      if card.is_ace?
        total += 1
        has_ace = true
      elsif card.is_face_card?
        total += 10
      else
        total += card.rank.to_i
      end
    end

    if total <= 11 && has_ace
      total += 10
    end

    total
  end

  def busted?
    score > 21
  end

  def to_s
    @cards.join(", ")
  end
end
