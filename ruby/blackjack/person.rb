require_relative 'hand'

class Person
    attr_reader :hand
    attr_reader :win
    attr_reader :bust
    ACE_VALUES = {
        1 => [1,11],
        2 => [2,12],
        3 => [3,13],
        4 => [4,14]
    }

    def initialize(blackjack)
        @hand = Hand.new
        @blackjack = blackjack
        @win = false
        @bust = false
    end

    def hit_me
        if !@win and !@bust
            @hand.add_card(@blackjack.deal_card)
            win_or_bust
        end
    end

    def stay
        if !@win and !@bust
            @win = @blackjack.player_stays
        end
    end

    def possible_hand_values
        ace_count = 0
        base_value = 0
        @hand.cards.each do |card|
            if card.name == :ace
                ace_count += 1
            else
                base_value += Blackjack::CARD_VALUES[card.name]
            end
        end

        possible_hand_values = []
        if ace_count > 0
            possible_hand_values << (base_value + ACE_VALUES[ace_count][0])
            possible_hand_values << (base_value + ACE_VALUES[ace_count][1])
        else
            possible_hand_values << base_value
        end
    end

    def dealer_card_shown
        @blackjack.dealer_card_shown
    end

private
    def win_or_bust
        if @hand.cards.size == 2 and possible_hand_values.any? {|value| value == 21}
            @win = true
        elsif possible_hand_values.all? {|value| value > 21}
            @bust = true
        end
    end    
end

class Player < Person

end

class Dealer < Person
    attr_writer :win
    attr_writer :bust
end