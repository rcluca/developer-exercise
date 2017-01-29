require_relative 'deck'
require_relative 'hand'

class Blackjack
  attr_accessor :player_hand
  attr_accessor :dealer_hand

  def initialize
    @deck = Deck.new
  end

  def deal_to_player
    @player_hand = Hand.new
    @player_hand.add_card(@deck.deal_card)
    @player_hand.add_card(@deck.deal_card)
  end

  def deal_to_dealer
    @dealer_hand = Hand.new
    @dealer_hand.add_card(@deck.deal_card)
    @dealer_hand.add_card(@deck.deal_card)
  end
end