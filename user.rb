class User < Player
  attr_reader :cash

  def what_first_two
    players_two
  end

  def what_one_more
    players_one_more
  end
end
