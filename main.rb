require_relative 'interface.rb'
require_relative 'winner.rb'
require_relative 'game.rb'
require_relative 'cards_calc.rb'
require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'player.rb'

interface = Interface.new
game = Game.new(interface)

game.start_game
