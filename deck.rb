class Deck
  attr_reader :first_card, :second_card, :card3
  attr_accessor :third_card

  include CardsCalc

  SUITS = ['♡', '♢', '♤', '♧'].freeze
  CARDS = %w[2 3 4 5 6 7 8 9 A J Q K].freeze

  def take_two
    @card1 = [CARDS.sample, SUITS.sample]
    @card2 = [CARDS.sample, SUITS.sample]
  end

  def take_third
    @card3 = [CARDS.sample, SUITS.sample]
    calculate_card3
  end

  def show_card1
    @card1[0] + @card1[1]
  end

  def show_card2
    @card2[0] + @card2[1]
  end

  def show_card3
    @card3[0] + @card3[1] unless @card3.nil?
  end
end
