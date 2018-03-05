module CardCalc
  def calculate_two(player)
    player.hand[0].value = 11 if player.hand[0].name == 'A' && player.hand[1].name != 'A'
    card1 = player.hand[0].value
    player.hand[1].value = 11 if player.hand[1].name == 'A'
    player.hand[1].value = 1 if player.hand[1].name == 'A' && card1 == 11
    card2 = player.hand[1].value
    player.points = card1 + card2
  end

  def calculate_three(player)
    card3 = player.hand[2].value
    card3 = 11 if ace11?(player)
    card3 = 1 if ace1?(player)
    player.points += card3
    player.points -= 10 if player.hand[0].value == 11 && player.points > 21
    player.points -= 10 if player.hand[1].value == 11 && player.points > 21
  end

 def ace11?(player)
    player.hand[2].name == 'A' && player.points + 11 < 21
  end

  def ace1?(player)
    player.hand[2].name == 'A' && player.points + 11 > 21
  end
end
