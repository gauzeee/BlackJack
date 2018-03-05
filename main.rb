require_relative 'game_interface.rb'
require_relative 'round_interface.rb'
require_relative 'winner.rb'
require_relative 'card_calc.rb'
require_relative 'game.rb'
require_relative 'round.rb'
require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'player.rb'

interface = GameInterface.new
game = Game.new(interface)

game.start_game
