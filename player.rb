class Player
  attr_accessor :cash, :hand, :deck, :points
  attr_reader :cards

  def initialize
    @hand = []
    @cash = 100
    @points = 0
  end
end
