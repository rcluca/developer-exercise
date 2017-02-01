require_relative '../card'

class DeckStub
  attr_reader :playable_cards
  SUITS = [:hearts]
  NAMES = [
    :two,
    :eight,
    :filler,
    :filler,
    :ace,
    :ace]

  def initialize
    shuffle
  end

  def deal_card
    @playable_cards.delete_at(0)
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