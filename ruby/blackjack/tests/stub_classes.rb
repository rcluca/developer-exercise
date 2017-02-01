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

  def initialize(provided_cards = nil)
    if provided_cards.nil?
      shuffle
    else
      @provided_cards = provided_cards
      @playable_cards = provided_cards
    end
  end

  def deal_card
    @playable_cards.delete_at(0)
  end

  def shuffle
    if @provided_cards.nil?
      @playable_cards = []
      SUITS.each do |suit|
        NAMES.each do |name|
          @playable_cards << Card.new(suit, name)
        end
      end
    end
  end
end