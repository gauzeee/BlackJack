class Round
  include Winner
  include CardCalc

  def initialize(user, dealer, deck, bank)
    @user = user
    @dealer = dealer
    @deck = deck
    @bank = bank
    @interface = RoundInterface.new
  end

  def begin_round
    first_two_cards(@user)
    first_two_cards(@dealer)
    @bank += 20
  end

  def winner
    if user_lose?
      user_looser
    elsif user_wins?
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

  def clear(player)
    @deck.cards << player.hand[0]
    @deck.cards << player.hand[1]
    @deck.cards << player.hand[2] unless player.hand[2].nil?
    slice_hand(player)
    @deck.mix_deck
  end

  def dealer_plays(player)
    return if player.points > 17
    one_more(player) if player.points < 17
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
    @interface.user_wins(@user)
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
