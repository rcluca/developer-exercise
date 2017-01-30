require 'test/unit'
require_relative '../blackjack'

class BlackjackTest < Test::Unit::TestCase
    def setup
        @blackjack = Blackjack.new
    end
  
    def test_given_a_player_is_dealt_a_hand_then_hand_has_two_cards
        @blackjack.deal_to_player
        assert(@blackjack.player.hand.cards.size == 2)
    end

    def test_given_a_dealer_is_dealt_a_hand_then_hand_has_two_cards
        @blackjack.deal_to_dealer
        assert(@blackjack.dealer.hand.cards.size == 2)
    end

    def test_given_dealer_has_been_dealt_hand_then_second_card_dealt_is_shown
        @blackjack.deal_to_dealer
        assert(@blackjack.dealer_card_shown == @blackjack.dealer.hand.cards[1])
    end

    def test_given_dealer_has_not_been_dealt_hand_then_exception_is_raised
        assert_raise do
            @blackjack.dealer_card_shown
        end
    end
end