require 'test/unit'
require_relative '../card'

class CardTest < Test::Unit::TestCase
  def setup
    @card = Card.new(:hearts, :ten)
  end
  
  def test_card_suit_is_correct
    assert_equal @card.suit, :hearts
  end

  def test_card_name_is_correct
    assert_equal @card.name, :ten
  end
end