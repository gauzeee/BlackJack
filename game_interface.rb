class GameInterface
  attr_reader :again_choice, :player_name

  def who_are_you
    puts 'Welcome to Black Jack Table!'
    puts 'What is your name, friend?'
    @player_name = gets.chomp
    puts "Let`s play Black Jack, #{@player_name}!"
  end

  def play_again(user)
    puts 'Do you want play again?'
    puts 'Y - Yes, N - No'
    @again_choice = gets.chomp
  end

  def error
    puts "Wrong answer!"
  end

  def no_money
    puts "Sorry, #{@player_name}, your pockets is empty. Come again =)"
  end
end
