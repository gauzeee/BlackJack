class RoundInterface

  TO_DO_POINTS = [
    'Enter P, to PASS', 'Enter M, to get one MORE card',
    'Enter O, to OPEN cards'
  ].freeze

  def menu(start_sum)
    puts "You now have two cards with #{start_sum} points"
    TO_DO_POINTS.each { |point| puts point }
  end

  def menu_choice
    @choice = gets.chomp
    @choice.capitalize
  end

  def dealer_plays(player)
    return if player.points > 17
    one_more(player) if player.points < 17
  end

  def open_cards(user, dealer, player_name)
    puts "#{player_name}, now you have"
    hand(user)
    puts "Summury #{user.points} points!"
    puts 'Dealer have'
    hand(dealer)
    puts "Summary #{dealer.points} points!"
  end

  def hand(name)
    name.hand.each { |card| puts "#{card.name} #{card.suit}" }
  end

  def users_two(usr)
    puts 'Your cards'
    puts usr.hand[0].name + usr.hand[0].suit , usr.hand[1].name + usr.hand[1].suit
  end

  def dealers_two
    puts 'Dealer cards'
    puts '*'
    puts '*'
  end

  def error
    puts "Wrong answer! Choose again"
  end

  def users_one_more(user)
    puts "Now you have #{user.hand[2].name + user.hand[2].suit}"
  end

  def dealers_one_more
    puts 'Dealer take one more card'
  end

  def user_wins(user, player_name)
    puts "#{player_name}, you are WINNER!"
    puts "You got now #{user.cash} $"
  end

  def user_lose(user)
    puts 'Sorry! You lose.'
    puts "You got now #{user.cash} $"
  end

  def all_lose
    puts 'No winner there =)'
  end
end
