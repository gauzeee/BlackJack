class Player
  attr_accessor :cash, :hand
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @hand = []
    @cash = 100
    @cards = []
  end
end
