require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def setup
    @card = Card.new("10", "Hearts")
    @card2 = Card.new("Queen", "Clubs")
    @guess = Guess.new("10 of Hearts", @card)
    @guess2 = Guess.new("2 of Diamonds", @card2)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Guess, @guess
    assert_equal "10 of Hearts", @guess.response
    assert_equal @card, @guess.card
    assert_equal @card2, @guess2.card
    assert_equal "2 of Diamonds", @guess2.response
  end

  def test_it_knows_if_it_is_correct
    assert_equal true, @guess.correct?

    assert_equal false, @guess2.correct?
  end

  def test_it_can_give_feedback
    assert_equal "Correct!", @guess.feedback

    assert_equal "Incorrect.", @guess2.feedback
  end
end
