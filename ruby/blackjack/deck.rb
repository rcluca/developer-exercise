require_relative 'card'

class Deck
  attr_reader :playable_cards
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  NAMES = [
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    :ace]

  def initialize
    shuffle
  end

  def deal_card
    random = rand(@playable_cards.size)
    @playable_cards.delete_at(random)
  end

  def shuffle
    @playable_cards = []
    SUITS.each do |suit|
      NAMES.each do |name|
        @playable_cards << Card.new(suit, name)
      end
    end
  end
end