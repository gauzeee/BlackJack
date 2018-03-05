module Winner
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
end
