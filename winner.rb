module Winner
  def user_winner
    user_wins_cash
    @interface.user_wins(@user)
    again
  end

  def user_looser
    user_lose_cash
    @interface.user_lose(@user)
    again
  end

  def all_loosers
    all_lose_cash
    @interface.all_lose
    again
  end

  def dealer_wins?
    @dealer.points <= 21 && @dealer.points > @user.points
  end

  def dealer_lose?
    @user.points <= 21 && @user.points > @dealer.points
  end

  def user_lose?
    @user.points > 21 || dealer_wins?
  end

  def user_wins?
    @dealer.points > 21 || dealer_lose?
  end

  def who_is_winner
    if user_lose?
      user_looser
    elsif user_wins?
      user_winner
    else
      all_loosers
    end
  end
end
