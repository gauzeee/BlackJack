class Game
  #include Interface

  attr_reader :user, :dealer
  attr_accessor :bank

  def initialize(interface)
    @interface = interface
    @user = User.new
    @dealer = Dealer.new
    @bank = 0
  end

  def start_game
    @interface.who_are_you
    continue_game
  end

  def go_game
    @user.first_two_cards
    @dealer.first_two_cards
  end

  def continue_game
    go_game
    @bank += 20
    choose_next
  end

  def pass
    @dealer.dealer_plays
  end

  def one_more_card
    @user.one_more
  end

  def user_wins_cash
    @user.cash += @bank
    @bank -= 20
  end

  def user_lose_cash
    @dealer.cash += @bank
    @bank -= 20
  end

  def all_lose_cash
    @bank -= 20
    @user.cash += 10
    @dealer.cash += 10
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

  def choose_next
    @interface.menu
    loop do
      choice = gets.chomp
      send TO_DO[choice]
      open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
    end
  end

  def again
    @user.hand[2] = 0
    @dealer.hand[2] = 0
    play_again
    continue_game if @again_choice == 'Y' && @user.cash > 0
    exit if @again_choice == 'N'
  end
end
