require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @card_4 = Card.new("Jack", "Clubs")
    @card_5 = Card.new("Ace", "Diamonds")
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5 ]
    @deck = Deck.new(@cards)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Deck, @deck
    assert_equal @cards, @deck.cards
  end

  def test_it_can_count_cards
    assert_equal 5, @deck.count
  end

  def test_it_can_sort_cards_by_suit

  end
  def test_it_can_sort_cards
    expected = [@card_1, @card_3, @card_4, @card_5, @card_2]
    assert_equal expected, @deck.sort
  end
end
