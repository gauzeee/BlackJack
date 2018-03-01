class Dealer < Player
  attr_reader :cash

  def what_first_two
    @interface.dealers_two
  end

  def what_one_more
    @interface.dealers_one_more
  end

  def dealer_plays
    return if start_sum > 17
    one_more if start_sum < 17
  end
end
