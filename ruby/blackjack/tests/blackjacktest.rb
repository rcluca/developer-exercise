require 'test/unit'
require_relative 'stub_classes.rb'
require_relative '../blackjack'

class BlackjackTest < Test::Unit::TestCase
    def setup
        @deck_stub = DeckStub.new
    end

    def test_given_a_new_blackjack_game_then_player_is_dealt_two_cards
        player = Blackjack.start_playing(@deck_stub)
        assert(player.hand.cards.size == 2)
    end

    def test_given_a_new_blackjack_game_then_dealer_card_shown_is_second_dealt_to_dealer
        cards = [Card.new(:hearts,:ten),Card.new(:hearts,:queen),Card.new(:hearts,:three),Card.new(:hearts,:four)]
        player = Blackjack.start_playing(DeckStub.new(cards))
        assert(player.dealer_card_shown.suit == :hearts)
        assert(player.dealer_card_shown.name == :four)
    end
end