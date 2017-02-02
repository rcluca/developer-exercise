require_relative 'hand'

class Person
    attr_reader :hand
    attr_reader :win
    attr_reader :bust

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
        ace_values = []
        base_value = 0
        @hand.cards.each do |card|
            if card.name == :ace
                ace_values.push(*Blackjack::CARD_VALUES[card.name])
            else
                base_value += Blackjack::CARD_VALUES[card.name]
            end
        end

        possible_hand_values = []
        if ace_values.size > 0
            possible_ace_values = ace_values.combination(ace_values.size/2).to_a.uniq

            possible_ace_values.each do |values|
                aces_value = 0
                values.each do |value|
                    aces_value += value
                end
                possible_hand_values << (base_value + aces_value)
            end

            possible_hand_values = possible_hand_values.uniq
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