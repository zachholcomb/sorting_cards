class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    card_name = "#{card.value} of #{card.suit}"
    card_name == @response
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end


end
