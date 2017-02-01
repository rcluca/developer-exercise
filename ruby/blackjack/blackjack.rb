require_relative 'deck'
require_relative 'hand'
require_relative 'person'

class Blackjack
    attr_reader :dealer_card_shown
    attr_reader :player

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

    def self.start_playing(deck)
      blackjack = Blackjack.new(deck)
      blackjack.player
    end

    def deal_card
      @deck.deal_card
    end

private
    :new
    def initialize(deck)
        deck.shuffle
        @deck = deck
        @player = Player.new(self)
        @dealer = Dealer.new(self)
        @person_set = false

        deal_to_player
        deal_to_dealer
    end

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