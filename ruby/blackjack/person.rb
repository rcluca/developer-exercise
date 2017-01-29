require_relative 'hand'

class Person
    attr_accessor :hand

    def initialize
        @hand = Hand.new
    end

    def add_card_to_hand(card)
        @hand.add_card(card)
    end
end