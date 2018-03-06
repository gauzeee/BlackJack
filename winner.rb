module Winner
  def dealer_wins?(user, dealer)
    dealer.points <= 21 && dealer.points > user.points
  end

  def dealer_lose?(user, dealer)
    user.points <= 21 && user.points > dealer.points
  end

  def user_lose?(user, dealer)
    user.points > 21 || dealer_wins?(user, dealer)
  end

  def user_wins?(user, dealer)
    dealer.points > 21 || dealer_lose?(user, dealer)
  end
end
