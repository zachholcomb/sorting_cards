class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort_by_suit
    @cards.each_con do |card1, card2|
      require "pry"; binding.pry
    end
  end

  def sort

  end
end
