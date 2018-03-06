class Game
  attr_reader :user, :dealer
  attr_accessor :bank, :deck

  TO_DO = { 'P' => :pass, 'M' => :one_more_card, 'O' => :open_cards }.freeze

  def initialize(interface)
    @interface = interface
    @user = Player.new
    @dealer = Player.new
    @bank = 0
  end

  def start_game
    @interface.who_are_you
    @player_name = @interface.player_name
    continue_game
  end

  private

  def continue_game
    begin_round
    again
  end

  def begin_round
    @round = Round.new(@user, @dealer, @bank, @player_name)
    @round.begin_round
  end

  def again
    @round.clear(@user)
    @round.clear(@dealer)
    @interface.play_again(@user)
    if @user.cash > 0
      continue_game if @interface.next_game == true
    else
      @interface.no_money
    end
  end
end
