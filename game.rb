class Game
  attr_reader :user, :dealer
  attr_accessor :bank

  include Winner

  TO_DO = { 'P' => :pass, 'M' => :one_more_card, 'O' => :open_cards }.freeze

  def initialize(interface)
    @interface = interface
    @user_deck = Deck.new
    @dealer_deck = Deck.new
    @user = User.new(@user_deck)
    @dealer = Dealer.new(@dealer_deck)
    @bank = 0
  end

  def start_game
    @interface.who_are_you
    continue_game
  end

  def go_game
    @user.first_two_cards(@interface)
    @dealer.first_two_cards(@interface)
  end

  def continue_game
    go_game
    @bank += 20
    choose_next
  end

  def pass
    @dealer.dealer_plays(@interface)
    open_cards
  end

  def one_more_card
    @user.one_more(@interface)
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
    who_is_winner
  end

  def open_cards
    @interface.open_cards(@user, @dealer)
    winner
  end

  def choose_next
    @interface.menu(@user.start_sum)
    loop do
      send TO_DO[@interface.menu_choice]
      open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
    end
  end

  def again
    @user.hand.delete(@user.hand[2])
    @dealer.hand.delete(@dealer.hand[2])
    @interface.play_again(@user)
    continue_game if @interface.next_game == true
  end
end
