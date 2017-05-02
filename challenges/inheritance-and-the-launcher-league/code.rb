
class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    "Normality"
  end

  def weakness
    "Only exists in comic books!"
  end

  def backstory
    "Grew up in a family of four with a dog. The dog was his/her best friend and they would go on great adventures together."
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
  attr_reader :secret_identity
end

class Speedster < SuperHero
  def speed_in_mph
    super*1000
  end
  def powers
    "SUPER FAST!!!"
  end
end

class Brawler < SuperHero
  def health
    super*20
  end
  def powers
    "Can use Goku's famous Kamehameha wave and turn into a super-saiyan"
  end
  def home
    "Earth"
  end
  def species
    "Human"
  end
end

class Detective < SuperHero
  def powers
    "Deductive Reasoning"
  end
  def weakness
    @secret_identity
  end
  def speed_in_mph
    super/6.0
  end
end

class Demigod < SuperHero
  def home
    "Cosmic Plane"
  end
  def powers
    "Interdimentional challenge"
  end
end

class JackOfAllTrades < SuperHero
  def species
    "Alien"
  end

  def home
    "Venus"
  end
  def psychic?
    true
  end
  def powers
    "Average at everything, a master at nothing..."
  end
end

class WaterBased < SuperHero
  def fans_per_thousand
    super/100
  end
  def home
    "#{super}'s Oceans"
  end
  def psychic?
    true
  end
  def powers
    "Can breathe underwater!"
  end
end
