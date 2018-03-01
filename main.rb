require_relative 'interface.rb'
require_relative 'game.rb'
require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'user.rb'
require_relative 'dealer.rb'

interface = Interface.new#(interface)
game = Game.new(interface)

game.start_game
