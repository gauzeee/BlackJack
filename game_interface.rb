class GameInterface
  attr_reader :next_game

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
    @choice.capitalize!
  end

  def who_are_you
    puts 'Welcome to Black Jack Table!'
    puts 'What is your name, friend?'
    @player_name = gets.chomp
    puts "Let`s play Black Jack, #{@player_name}!"
  end

  def dealer_plays(player)
    return if player.points > 17
    one_more(player) if player.points < 17
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

  def play_again(user)
    puts 'Do you want play again?'
    puts 'Y - Yes, N - No'
    @again_choice = gets.chomp
    @again_choice.capitalize!
    @next_game = true if @again_choice == 'Y' && user.cash > 0
    exit if @again_choice == 'N'
  end
end
