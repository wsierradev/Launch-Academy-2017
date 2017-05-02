module PartyGoer
  attr_reader :drink_count

  def initialize
    @drink_count = 0
  end

  def drink
    @drink_count += 1
    @drink_count <= 3
  end

  def sing
    "This is how we do iiiitt!!"
  end

  def cause_havoc
    raise PersonalizedHavocError
  end

  def invited?
    true
  end

  def self.included(base)
    base.extend(PartyGoer)
  end
end

class PersonalizedHavocError < StandardError
  def message
    "You should define this yourself!"
  end
end

class Launcher
  include PartyGoer

end
