class Game
  attr_reader :user, :dealer
  attr_accessor :bank, :deck

  TO_DO = { 'P' => :pass, 'M' => :one_more_card, 'O' => :open_cards }.freeze

  def initialize(interface)
    @interface = interface
    @deck = Deck.new
    @user = Player.new
    @dealer = Player.new
    @bank = 0
  end

  def start_game
    @interface.who_are_you
    @deck.mix_deck
    round
  end

  private

  def round
    begin_round
    choose_next
  end

  def begin_round
    @round = Round.new(@user, @dealer, @deck, @bank)
    @round.begin_round
  end

  def choose_next
    @interface.menu(@user.points)
    loop do
      send TO_DO[@interface.menu_choice]
      open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
    end
  end

  def open_cards
    @interface.open_cards(@user, @dealer)
    @round.winner
    again
  end

  def one_more_card
    @round.one_more(@user)
  end

  def pass
    @round.dealer_plays(@dealer)
  end

  def again
    @round.clear(@user)
    @round.clear(@dealer)
    @interface.play_again(@user)
    round if @interface.next_game == true
  end
end
