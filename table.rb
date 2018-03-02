class Table
  include Interface

  def initialize(game)
    @game = game
  end

  def start_game
    @interface.who_are_you
    @game.continue_game
  end
end
