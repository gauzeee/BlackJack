require_relative 'interface.rb'
require_relative 'game.rb'
require_relative 'table.rb'
require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'user.rb'
require_relative 'dealer.rb'

game = Game.new
table = Table.new(game)
table.start_game
