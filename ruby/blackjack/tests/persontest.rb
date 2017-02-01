require 'test/unit'
require_relative 'stub_classes.rb'
require_relative '../blackjack'
require_relative '../person'

class PersonTest < Test::Unit::TestCase
    def setup
        @deck = Deck.new
        @deck_stub = DeckStub.new
    end

    def test_given_a_player_hits_then_their_hand_size_increases_by_one
        blackjack = Blackjack.new(@deck)
        player = blackjack.get_person_to_play_with(:player)
        player.hit_me
        assert(player.hand.cards.size == 3)
    end

    def test_given_a_player_has_a_two_card_hand_without_aces_then_player_hand_value_is_calculated_correctly
        blackjack = Blackjack.new(@deck_stub)
        player = blackjack.get_person_to_play_with(:player)
        possible_hand_values = player.possible_hand_values
        assert(possible_hand_values.size == 1)
        assert(possible_hand_values.any? {|value| value == 10})
    end

    def test_given_a_player_has_a_three_card_hand_with_one_ace_then_player_hand_value_is_calculated_correctly
        blackjack = Blackjack.new(@deck_stub)
        player = blackjack.get_person_to_play_with(:player)
        player.hit_me
        possible_hand_values = player.possible_hand_values
        assert(possible_hand_values.size == 2)
        assert(possible_hand_values.any? {|value| value == 11})
        assert(possible_hand_values.any? {|value| value == 21})
    end

    def test_given_a_player_has_a_four_card_hand_with_two_aces_then_player_hand_value_is_calculated_correctly
        blackjack = Blackjack.new(@deck_stub)
        player = blackjack.get_person_to_play_with(:player)
        player.hit_me
        player.hit_me
        possible_hand_values = player.possible_hand_values
        assert(possible_hand_values.size == 3)
        assert(possible_hand_values.any? {|value| value == 12})
        assert(possible_hand_values.any? {|value| value == 22})
        assert(possible_hand_values.any? {|value| value == 32})
    end    
end