require_relative 'deck'
require_relative 'hand'
require_relative 'person'

class Blackjack
  attr_accessor :player
  attr_accessor :dealer

  def initialize
    @deck = Deck.new
    @player = Person.new
    @dealer = Person.new
  end

  def deal_to_player
    @player.add_card_to_hand(@deck.deal_card)
    @player.add_card_to_hand(@deck.deal_card)
  end

  def deal_to_dealer
    @dealer.add_card_to_hand(@deck.deal_card)
    @dealer.add_card_to_hand(@deck.deal_card)
  end
end