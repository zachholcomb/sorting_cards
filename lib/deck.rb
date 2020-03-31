class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort_cards_by_suit(cards, suit)
    suit_sorted_cards = []
    cards.each do |card|
      suit_sorted_cards << card if card.suit == suit
    end
    suit_sorted_cards
  end

  def sort_into_suits(suits)
    suits.reduce({}) do |acc, suit|
      acc[suit] = sort_cards_by_suit(@cards, suit)
      acc
    end
  end

  def sort_cards_by_value(cards)
    cards.reduce({}) do |acc, card|
      if acc[:face_cards].nil? and card.value.length > 2
        acc[:face_cards] = [card]
      elsif !acc[:face_cards].nil? and card.value.length > 2
        acc[:face_cards] << card
      elsif acc[:number_cards].nil? and card.value.length < 2
        acc[:number_cards] = [card]
      elsif !acc[:number_cards].nil? and card.value.length < 2
        acc[:number_cards] << card
      end
      acc
    end
  end

  def sort_by_face_cards(cards)
    sorted_face_cards = []
    cards.each do |card|
      sorted_face_cards << card if card.value == "Ace"
    end
    cards.each do |card|
      sorted_face_cards << card if card.value == "King"
    end
    cards.each do |card|
      sorted_face_cards << card if card.value == "Queen"
    end
    cards.each do |card|
      sorted_face_cards << card if card.value == "Jack"
    end
    sorted_face_cards
  end

  def sort_cards_by_number(cards)
    cards.sort_by do |card|
      card.value.to_i
    end.reverse
  end

  def sort_whole_suit(cards)
    if !(cards == [])
      sorted_cards = sort_cards_by_value(cards)
      face_cards = sort_by_face_cards(sorted_cards[:face_cards])
      number_cards =  sort_cards_by_number(sorted_cards[:number_cards])
      face_cards + number_cards
    else
      []
    end
  end

  def sort
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    sorted = sort_into_suits(suits)
    spades = sort_whole_suit(sorted["Spades"])
    hearts = sort_whole_suit(sorted["Hearts"])
    clubs = sort_whole_suit(sorted["Clubs"])
    diamonds = sort_whole_suit(sorted["Diamonds"])
    spades + hearts + clubs + diamonds
  end
end
