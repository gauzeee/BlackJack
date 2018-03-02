class Interface
  attr_reader :next_game

  TO_DO_POINTS = [
    'Enter P, to PASS', 'Enter M, to get one MORE card',
    'Enter O, to OPEN cards'
  ].freeze

  def menu(start_sum)
    puts "You now have two cards with #{start_sum} points"
    TO_DO_POINTS.each { |point| puts point }
  end

  def who_are_you
    puts 'Welcome to Black Jack Table!'
    puts 'What is your name, friend?'
    @player_name = gets.chomp
    puts "Let`s play Black Jack, #{@player_name}!"
  end

  def menu_choice
    @choice = gets.chomp
    @choice.capitalize!
  end

  def open_cards(user, dealer)
    puts "#{@player_name}, now you have"
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

  def users_one_more(user)
    puts "Now you have #{user.hand[2].name + user.hand[2].suit}"
  end

  def dealers_one_more
    puts 'Dealer take one more card'
  end

  def user_wins(user)
    puts "#{@player_name} - WINNER!"
    puts "You got now #{user.cash} $"
  end

  def user_lose(user)
    puts 'Sorry! You lose.'
    puts "You got now #{user.cash} $"
  end

  def all_lose
    puts 'No winner there =)'
  end

  def play_again(user)
    puts 'Do you want play again?'
    puts 'Y - Yes, N - No'
    @again_choice = gets.chomp
    @again_choice.capitalize!
    @next_game = true if @again_choice == 'Y' && user.cash > 0
    exit if @again_choice == 'N'
  end
end
