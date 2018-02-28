module Deck
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
    @third_card = @card3[0].to_i
    @third_card = 10 if @card3[0] == 'J' || @card3[0] == 'Q' || @card3[0] == 'K'
  end

  def calculate_card1
    @first_card = @card1[0].to_i
    @first_card = 10 if @card1[0] == 'J' || @card1[0] == 'Q' || @card1[0] == 'K'
    @first_card = 11 if @card1[0] == 'A'
  end

  def calculate_card2
    @second_card = @card2[0].to_i
    @second_card = 10 if @card2[0] == 'J' || @card2[0] == 'Q' || @card2[0] == 'K'
    @second_card = 11 if @card2[0] == 'A'
  end

  def calculate
    calculate_card1
    calculate_card2
  end
end
