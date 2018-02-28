module Game
  TO_DO_POINTS = [
    'Enter 1, to PASS', 'Enter 2, to get ONE more card',
    'Enter 3, to OPEN cards'
  ].freeze

  TO_DO = { '1' => :pass, '2' => :one_more, '3' => :open_cards }.freeze

  def go_game
    @user.first_two_cards
    @dealer.first_two_cards
  end

  def pass
    @dealer.dealer_plays
  end

  def one_more
    @user.one_more
  end

  def open_cards
    puts "#{@user.player_name}, now you have"
    puts "#{@user.cards_on_hand}"
    puts "Summury #{@user.final_sum} points!"
    puts "Dealer have"
    puts "#{@dealer.cards_on_hand}"
    puts "Summary #{@dealer.final_sum} points!"
    winner
  end

  def user_wins
    puts "#{@user.player_name} - WINNER!"
    @user.cash += @bank
    @bank -= 20
    puts "You got now #{@user.cash} $"
    again
  end

  def user_lose
    puts 'Sorry! You lose.'
    @dealer.cash += @bank
    @bank -= 20
    puts "You got now #{@user.cash} $"
    again
  end

  def all_lose
    puts 'No winner there =)'
    @bank -= 20
    @user.cash += 10
    @dealer.cash += 10
    again
  end

  def winner
    if @user.final_sum > 21 || @dealer.final_sum > @user.final_sum
      user_lose
    elsif @dealer.final_sum > 21 || @user.final_sum > @dealer.final_sum
      user_wins
    else
      all_lose
    end
  end

  def menu
    puts "You now have two cards with #{@user.start_sum} points"
    TO_DO_POINTS.each { |point| puts point }
  end

  def choose_next
    menu
    loop do
      choice = gets.chomp
      send TO_DO[choice]
      open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
    end
  end

  def again
    @user.hand[2] = 0
    @dealer.hand[2] = 0
    puts 'Do you want play again?'
    puts 'Y - Yes, N - No'
    again_choice = gets.chomp
    again_choice.capitalize!
    continue_game if again_choice == 'Y' && @user.cash > 0
    exit if again_choice == 'N'
  end
end
