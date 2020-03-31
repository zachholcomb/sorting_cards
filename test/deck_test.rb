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
    @card_6 = Card.new("4", "Hearts")
    @card_7 = Card.new("5", "Hearts")
    @card_8 = Card.new("6", "Hearts")
    @card_9 = Card.new("Queen", "Hearts")
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8, @card_9]
    @deck = Deck.new(@cards)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Deck, @deck
    assert_equal @cards, @deck.cards
  end

  def test_it_can_count_cards
    assert_equal 9, @deck.count
  end

  def test_it_can_sort_cards_by_suit
    expected = [@card_1, @card_6, @card_7, @card_8, @card_9]
    assert_equal expected, @deck.sort_cards_by_suit(@cards, "Hearts")
  end

  def test_it_can_sort_all_deck_into_all_suits
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    expected = {
      "Spades" => [],
      "Hearts" => [@card_1, @card_6, @card_7, @card_8, @card_9],
      "Clubs" => [@card_2, @card_4],
      "Diamonds" => [@card_3, @card_5]
    }
    assert_equal expected, @deck.sort_into_suits(suits)
  end

  def test_it_can_sort_by_face_cards
    assert_equal [@card_4], @deck.sort_by_face_cards([@card_4, @card_2])
    assert_equal [@card_5, ], @deck.sort_by_face_cards([@card_5, @card_3])
  end


  def test_it_can_sort_cards_by_number
    test = [@card_1, @card_6, @card_7, @card_8]
    expected = [@card_8, @card_7, @card_6, @card_1]
    assert_equal expected, @deck.sort_cards_by_number(test)
  end

  def test_it_can_sort_all_cards_of_one_suit
    card_10 = Card.new("King", "Hearts")
    test = [@card_1, @card_6, @card_7, @card_8, @card_9, card_10]
    expected = [card_10, @card_9, @card_8, @card_7, @card_6, @card_1]
    assert_equal expected, @deck.sort_whole_suit(test)
  end

  def test_it_can_sort_deck
    expected = [@card_9,
                @card_8,
                @card_7,
                @card_6,
                @card_1,
                @card_4,
                @card_2,
                @card_5,
                @card_3]
    assert_equal expected, @deck.sort
  end
end
