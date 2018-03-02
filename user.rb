class User < Player
  attr_reader :cash, :deck

  def what_first_two(interface, deck)
    interface.users_two(deck)
  end

  def what_one_more(interface, deck)
    interface.users_one_more(deck)
  end
end
