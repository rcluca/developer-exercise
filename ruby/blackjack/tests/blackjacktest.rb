require 'test/unit'
require_relative '../blackjack'

class BlackjackTest < Test::Unit::TestCase
    def setup
        @blackjack = Blackjack.new
    end
  
    def test_given_a_new_blackjack_game_then_player_is_dealt_two_cards
        blackjack = Blackjack.new
        player = blackjack.get_person_to_play_with(:player)
        assert(player.hand.cards.size == 2)
    end

    def test_given_a_new_blackjack_game_then_dealer_is_dealt_two_cards
        blackjack = Blackjack.new
        dealer = blackjack.get_person_to_play_with(:dealer)
        assert(dealer.hand.cards.size == 2)
    end

    def test_given_a_new_blackjack_game_then_dealer_card_shown_is_second_dealt_to_dealer
        blackjack = Blackjack.new
        dealer = blackjack.get_person_to_play_with(:dealer)
        assert(blackjack.dealer_card_shown == dealer.hand.cards[1])
    end
end