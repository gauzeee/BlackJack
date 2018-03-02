class Interface
  attr_reader :menu, :menu_choice, :next_game

  TO_DO_POINTS = [
    'Enter P, to PASS', 'Enter M, to get one MORE card',
    'Enter O, to OPEN cards'
  ].freeze

  def menu(start_sum, s)
    puts "You now have two cards with #{start_sum} points Dil = #{s}"
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
    puts user.cards_on_hand.to_s
    puts "Summury #{user.final_sum} points!"
    puts 'Dealer have'
    puts dealer.cards_on_hand.to_s
    puts "Summary #{dealer.final_sum} points!"
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
