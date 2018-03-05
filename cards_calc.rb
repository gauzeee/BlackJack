module CardsCalc
  def take_two

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

  def write_cards(player)
    c1 = @card1[0] + @card1[1]
    player.cards[0] = c1
    c2 = @card2[0] + @card2[1]
    player.cards[1] = c2
  end

  def write_third(player)
    c3 = @card3[0] + @card3[1]
    player.cards[2] = c3
  end

  def calculate_card1
    @first_card = @card1[0].to_i
    @first_card = 10 if @card1[0] == 'J' || @card1[0] == 'Q' || @card1[0] == 'K'
    @first_card = 1 if @card1[0] == 'A'
    @first_card = 11 if @card1[0] == 'A' && @card2[0] != 'A'
  end

  def calculate_card2
    @second_card = @card2[0].to_i
    @second_card = 10 if @card2[0] == 'J' || @card2[0] == 'Q' || @card2[0] == 'K'
    @second_card = 11 if @card2[0] == 'A'
    @second_card = 1 if @card2[0] == 'A' && @first_card == 11
  end

  def calculate_card3
    @third_card = @card3[0].to_i
    @third_card = 10 if @card3[0] == 'J' || @card3[0] == 'Q' || @card3[0] == 'K'
  end

  def calculate
    calculate_card1
    calculate_card2
  end
end
