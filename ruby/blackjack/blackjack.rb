require_relative 'deck'
require_relative 'hand'
require_relative 'person'

class Blackjack
    attr_reader :dealer_card_shown

    CARD_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10,
    :ace   => [11, 1]}

    def initialize()
        @deck = Deck.new
        @player = Player.new(self)
        @dealer = Dealer.new(self)
        @person_set = false

        deal_to_player
        deal_to_dealer
    end

    def get_person_to_play_with(person)
        if !@person_set
            if person == :player
              @person_set = true
              @player
            elsif person == :dealer
              @person_set = true
              @dealer
            else
              raise "Can only pick ':player' or ':dealer'."
            end
        end
    end

    def deal_card
      @deck.deal_card
    end

private
    def deal_to_player
        @player.hit_me()
        @player.hit_me()
    end

    def deal_to_dealer
        @dealer.hit_me()
        @dealer.hit_me()
        @dealer_card_shown = @dealer.hand.cards[1]
    end
end