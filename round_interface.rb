class RoundInterface
  def users_two(usr)
    puts 'Your cards'
    puts usr.hand[0].name + usr.hand[0].suit , usr.hand[1].name + usr.hand[1].suit
  end

  def dealers_two
    puts 'Dealer cards'
    puts '*'
    puts '*'
  end

  def users_one_more(user)
    puts "Now you have #{user.hand[2].name + user.hand[2].suit}"
  end

  def dealers_one_more
    puts 'Dealer take one more card'
  end

  def user_wins(user)
    puts "You are WINNER!"
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
