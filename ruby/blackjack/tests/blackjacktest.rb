require 'test/unit'
require_relative '../blackjack'

class BlackjackTest < Test::Unit::TestCase
  def setup
    @blackjack = Blackjack.new
  end
  
  def test_given_a_player_is_dealt_a_hand_then_hand_has_two_cards
    @blackjack.deal_to_player
    assert(@blackjack.player_hand.cards.size == 2)
  end
end