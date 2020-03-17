class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(guess_param)
    response = "#{guess_param[:value]} of #{guess_param[:suit]}"
    guess = Guess.new(response, current_card)
    @guesses << guess
    @deck.cards.shift
  end

  def number_correct
    @guesses.find_all do |guess|
      guess.correct?
    end.length
  end

  def percent_correct
    ((number_correct.to_f / @guesses.length)* 100).round(1)
  end
end
