class User < Player
  attr_reader :player_name, :cash

  def what_first_two_cards
    puts 'Your cards'
    show_two
  end

  def what_one_more
    puts "Now you got #{@card3[0].to_s + @card3[1].to_s}"
  end

  def who_are_you
    puts 'What is your name, friend?'
    @player_name = gets.chomp
    puts "Let`s play Black Jack, #{@player_name}!"
  end
end
