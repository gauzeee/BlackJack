class Player
  attr_accessor :cash, :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    @cash = 100
  end

  def first_two_cards(interface)
    @deck.take_two
    what_first_two(interface, @deck)
    @deck.calculate
    @hand[0] = @deck.first_card
    @hand[1] = @deck.second_card
    @hand[2] = @deck.third_card
    @cash -= 10
  end

  def one_more(interface)
    @deck.take_third
    what_one_more(interface, @deck)
    @deck.third_card = 11 if @deck.card3[0] == 'A' && start_sum + 11 < 21
    @deck.third_card = 1 if @deck.card3[0] == 'A' && start_sum + 11 > 21
    @hand[2] = @deck.third_card
    @hand[0] = 1 if @hand[0] == 11 && final_sum > 21
    @hand[1] = 1 if @hand[1] == 11 && final_sum > 21
    final_sum
  end

  def final_sum
    @hand[0].to_i + @hand[1].to_i + @hand[2].to_i
  end

  def start_sum
    @hand[0].to_i + @hand[1].to_i
  end
end
