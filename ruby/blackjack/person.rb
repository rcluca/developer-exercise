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
end

class Player < Person

end

class Dealer < Person

end