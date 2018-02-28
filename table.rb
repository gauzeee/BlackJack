require_relative 'player.rb'
require_relative 'user.rb'
require_relative 'dealer.rb'
require_relative 'deck.rb'
require_relative 'game.rb'

class Table
  include Deck
  include Game

  def initialize
    @bank = 0
    @user = User.new
    @dealer = Dealer.new
  end

  def start_game
    puts 'Welcome to Black Jack Table!'
    @user.who_are_you
    continue_game
  end

  def continue_game
    go_game
    @bank += 20
    choose_next
  end
end

table = Table.new
table.start_game
