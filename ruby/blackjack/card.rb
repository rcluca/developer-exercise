class Card
  attr_reader :suit, :name

  def initialize(suit, name)
    @suit, @name = suit, name
  end
end