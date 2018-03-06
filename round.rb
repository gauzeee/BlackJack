class Round
  include Winner
  include CardCalc

  TO_DO = { 'P' => :pass, 'M' => :one_more_card, 'O' => :open_cards }.freeze

  def initialize(user, dealer, bank, player_name)
    @user = user
    @dealer = dealer
    @deck = Deck.new
    @bank = bank
    @player_name = player_name
    @interface = RoundInterface.new
  end

  def begin_round
    @deck.mix_deck
    first_two_cards(@user)
    first_two_cards(@dealer)
    @bank += 20
    choose_next
  end

  def clear(player)
    slice_hand(player)
  end

  private

  def choose_next
    @interface.menu(@user.points)
    send TO_DO[@interface.menu_choice]
    open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
  end

  def open_cards
    @interface.open_cards(@user, @dealer, @player_name)
    winner(@user, @dealer)
  end

  def one_more_card
    one_more(@user)
  end

  def pass
    dealer_plays(@dealer)
  end

  def winner(user, dealer)
    if user_lose?(user, dealer)
      user_looser
    elsif user_wins?(user, dealer)
      user_winner
    else
      all_loosers
    end
  end

  def one_more(player)
    take_card(player)
    what_one_more(player)
    calculate_three(player)
  end

  def dealer_plays(player)
    return if player.points > 17
    one_more(player) if player.points < 17
    open_cards
  end

  private

  def take_card(player)
    player.hand << @deck.cards[0]
    @deck.cards.slice!(0)
  end

  def take_two(player)
    2.times { | i | take_card(player) }
  end

  def first_two_cards(player)
    take_two(player)
    what_first_two(@interface, player)
    calculate_two(player)
    player.points
    player.cash -= 10
  end

  def what_first_two(interface, player)
    @interface.users_two(player) if player == @user
    @interface.dealers_two if player == @dealer
  end

  def what_one_more(player)
    @interface.users_one_more(player) if player == @user
    @interface.dealers_one_more if player == @dealer
  end

  def user_wins_cash
    @user.cash += @bank
    @bank -= 20
  end

  def user_lose_cash
    @dealer.cash += @bank
    @bank -= 20
  end

  def user_winner
    user_wins_cash
    @interface.user_wins(@user, @player_name)
  end

  def user_looser
    user_lose_cash
    @interface.user_lose(@user)
  end

  def all_loosers
    all_lose_cash
    @interface.all_lose
  end

  def all_lose_cash
    @bank -= 20
    @user.cash += 10
    @dealer.cash += 10
  end

  def slice_hand(player)
    3.times { | i | player.hand.slice!(0) }
  end
end
