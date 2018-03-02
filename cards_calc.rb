module CardsCalc
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
