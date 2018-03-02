class Dealer < Player
  attr_reader :cash, :deck

  def what_first_two(interface, _deck)
    interface.dealers_two
  end

  def what_one_more(interface, _deck)
    interface.dealers_one_more
  end

  def dealer_plays(interface)
    return if start_sum > 17
    one_more(interface) if start_sum < 17
  end
end
