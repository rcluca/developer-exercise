require_relative 'hand'

class Person
    attr_reader :hand

    def initialize(blackjack)
        @hand = Hand.new
        @blackjack = blackjack
    end

    def hit_me
        @hand.add_card(@blackjack.deal_card)
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
end

class Player < Person

end

class Dealer < Person

end