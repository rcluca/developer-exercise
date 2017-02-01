require 'test/unit'
require_relative 'stub_classes.rb'
require_relative '../blackjack'
require_relative '../person'

class PersonTest < Test::Unit::TestCase
    def setup
        @deck_stub = DeckStub.new
    end

    def test_given_a_player_hits_then_their_hand_size_increases_by_one
        player = Blackjack.start_playing(@deck_stub)
        player.hit_me
        assert(player.hand.cards.size == 3)
    end

    def test_given_a_player_has_a_two_card_hand_without_aces_then_player_hand_value_is_calculated_correctly
        player = Blackjack.start_playing(@deck_stub)
        possible_hand_values = player.possible_hand_values
        assert(possible_hand_values.size == 1)
        assert(possible_hand_values.any? {|value| value == 10})
    end

    def test_given_a_player_has_a_three_card_hand_with_one_ace_then_player_hand_value_is_calculated_correctly
        player = Blackjack.start_playing(@deck_stub)
        player.hit_me
        possible_hand_values = player.possible_hand_values
        assert(possible_hand_values.size == 2)
        assert(possible_hand_values.any? {|value| value == 11})
        assert(possible_hand_values.any? {|value| value == 21})
    end

    def test_given_a_player_has_a_four_card_hand_with_two_aces_then_player_hand_value_is_calculated_correctly
        player = Blackjack.start_playing(@deck_stub)
        player.hit_me
        player.hit_me
        possible_hand_values = player.possible_hand_values
        assert(possible_hand_values.size == 3)
        assert(possible_hand_values.any? {|value| value == 12})
        assert(possible_hand_values.any? {|value| value == 22})
        assert(possible_hand_values.any? {|value| value == 32})
    end

    def test_given_a_player_has_a_two_card_hand_worth_less_than_21_then_player_has_not_won
        player = Blackjack.start_playing(@deck_stub)
        assert(player.win == false)
    end

    def test_given_a_player_has_a_two_card_hand_with_one_ace_and_a_card_worth_ten_then_player_has_won
        cards = [Card.new(:hearts,:ten),Card.new(:hearts,:ace)]
        player = Blackjack.start_playing(DeckStub.new(cards))
        assert(player.win == true)
    end
    
    def test_given_a_player_has_a_winning_hand_then_they_can_no_longer_hit
        cards = [Card.new(:hearts,:ten),Card.new(:hearts,:ace)]
        player = Blackjack.start_playing(DeckStub.new(cards))
        assert(player.hand.cards.size == 2)
        player.hit_me
        assert(player.hand.cards.size == 2)
    end

    def test_given_a_player_has_a_two_card_hand_worth_less_than_21_then_player_has_not_busted
        player = Blackjack.start_playing(@deck_stub)
        assert(player.bust == false)
    end    

    def test_given_a_player_has_a_hand_worth_over_21_then_player_has_busted
        cards = [Card.new(:hearts,:ten),Card.new(:hearts,:queen),Card.new(:hearts,:filler),Card.new(:hearts,:filler),Card.new(:hearts,:two)]
        player = Blackjack.start_playing(DeckStub.new(cards))
        player.hit_me
        assert(player.bust == true)
    end
    
    def test_given_a_player_has_a_busted_hand_then_they_can_no_longer_hit
        cards = [Card.new(:hearts,:ten),Card.new(:hearts,:queen),Card.new(:hearts,:filler),Card.new(:hearts,:filler),Card.new(:hearts,:two)]
        player = Blackjack.start_playing(DeckStub.new(cards))
        player.hit_me
        assert(player.hand.cards.size == 3)
        player.hit_me
        assert(player.hand.cards.size == 3)
    end          
end