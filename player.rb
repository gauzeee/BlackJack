class Player
  attr_accessor :cash, :hand

  include Deck

  def initialize
    @hand = []
    @cash = 100
  end

  def first_two_cards
    take_two
    what_first_two
    calculate
    @hand[0] = @first_card
    @hand[1] = @second_card
    @cash -= 10
  end

  def one_more
    take_third
    what_one_more
    @third_card = 11 if @card3[0] == 'A' && start_sum + 11 < 21
    @third_card = 1 if @card3[0] == 'A' && start_sum + 11 > 21
    @hand[2] = @third_card
    @hand[0] = 1 if @hand[0] == 11 && final_sum > 21
    @hand[1] = 1 if @hand[1] == 11 && final_sum > 21
    final_sum
  end

  def final_sum
    @hand[0].to_i + @hand[1].to_i + @hand[2].to_i
  end

  def cards_on_hand
    show_two
    @card3[0] + @card3[1] unless @card3.nil? || @hand[2].nil?
  end

  def start_sum
    @hand[0].to_i + @hand[1].to_i
  end
end
