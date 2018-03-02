module Deck
  include CardsCalc

  SUITS = ['♡', '♢', '♤', '♧'].freeze
  CARDS = %w[2 3 4 5 6 7 8 9 A J Q K].freeze

  def take_two
    @card1 = [CARDS.sample, SUITS.sample]
    @card2 = [CARDS.sample, SUITS.sample]
  end

  def show_two
    puts @card1[0] + @card1[1], @card2[0] + @card2[1]
  end

  def take_third
    @card3 = [CARDS.sample, SUITS.sample]
    calculate_card3
  end
end
