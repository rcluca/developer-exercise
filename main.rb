require_relative 'ruby/blackjack/blackjack'
require_relative 'ruby/blackjack/tests/stub_classes'

# deck = Deck.new
# player = Blackjack.start_playing(deck)
# player.hit_me
# player.stay
# puts player.win
# hand_values = player.possible_hand_values

# # @deck_stub = DeckStub.new
# # blackjack = Blackjack.new(@deck_stub)
# # player = blackjack.get_person_to_play_with(:player)
# # player.hit_me
# # player.hit_me
# # possible_hand_values = player.possible_hand_values
# cards = [Card.new(:hearts,:ten),Card.new(:hearts,:queen),Card.new(:hearts,:two),Card.new(:hearts,:three),Card.new(:hearts,:two)]
# player = Blackjack.start_playing(DeckStub.new(cards))
# result = player.hit_me
        cards = [Card.new(:hearts,:ten),Card.new(:hearts,:queen),Card.new(:hearts,:seven),Card.new(:hearts,:eight),Card.new(:hearts,:two)]
        player = Blackjack.start_playing(DeckStub.new(cards))
        player.stay
y = x