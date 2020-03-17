require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/deck'
require './lib/guess'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("3","Hearts")
    @card_2 = Card.new("4", "Clubs")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_exists_and_has_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.guesses
  end

  def test_it_has_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_record_guesses
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, @round.guesses.first
    assert_equal true, @round.guesses.first.correct?
    assert_equal 1, @round.guesses.length
    assert_equal @card_2, @round.current_card

    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, @round.guesses.count
    assert_equal false, @round.guesses.last.correct?
    assert_equal "Incorrect.", @round.guesses.last.feedback
  end

  def test_it_can_record_number_of_correct_answers
    @round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, @round.number_correct

    @round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, @round.number_correct
  end

  def test_it_can_calculate_percent_correct
    @round.record_guess({value: "3", suit: "Hearts"})
    @round.record_guess({value: "Jack", suit: "Diamonds"})

    assert_equal 50.0, @round.percent_correct
  end
end





# pry(main)> round.percent_correct
# #=> 50.0
