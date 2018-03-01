module Interface
  attr_reader :menu

  TO_DO_POINTS = [
    'Enter 1, to PASS', 'Enter 2, to get ONE more card',
    'Enter 3, to OPEN cards'
  ].freeze

  TO_DO = { '1' => :pass, '2' => :one_more_card, '3' => :open_cards }.freeze

  def menu
    puts "You now have two cards with #{@user.start_sum} points"
    TO_DO_POINTS.each { |point| puts point }
  end

  def who_are_you
    puts 'Welcome to Black Jack Table!'
    puts 'What is your name, friend?'
    @@player_name = gets.chomp
    puts "Let`s play Black Jack, #{@@player_name}!"
  end

  def open_cards
    puts "#{@@player_name}, now you have"
    puts "#{@user.cards_on_hand}"
    puts "Summury #{@user.final_sum} points!"
    puts "Dealer have"
    puts "#{@dealer.cards_on_hand}"
    puts "Summary #{@dealer.final_sum} points!"
    winner
  end

  def user_wins
    puts "#{@@player_name} - WINNER!"
    user_wins_cash
    puts "You got now #{@user.cash} $"
    again
  end

  def players_two
    puts 'Your cards'
    show_two
  end

  def dealers_two
    puts 'Dealer cards'
    puts '*'
    puts '*'
  end

  def players_one_more
    puts "Now you have #{@card3[0].to_s + @card3[1].to_s}"
  end

  def dealers_one_more
    puts "Dealer take one more card"
  end

  def user_lose
    puts 'Sorry! You lose.'
    user_lose_cash
    puts "You got now #{@user.cash} $"
    again
  end

  def all_lose
    puts 'No winner there =)'
    all_lose_cash
    again
  end

  def play_again
    puts 'Do you want play again?'
    puts 'Y - Yes, N - No'
    @again_choice = gets.chomp
    @again_choice.capitalize!
  end
end
