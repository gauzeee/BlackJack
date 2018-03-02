class Game
  attr_reader :user, :dealer, :final_sum
  attr_accessor :bank

  include Winner

  TO_DO = { 'P' => :pass, 'M' => :one_more_card, 'O' => :open_cards }.freeze

  def initialize(interface)
    @interface = interface
    @deck = Deck.new
    @user = Player.new(@deck)
    @dealer = Player.new(@deck)
    @bank = 0
  end

  def take_two(player)
    2.times { | i | take_card(player) }
  end

  def take_card(player)
    player.hand << @deck.cards[0]
    @deck.cards.delete_at(0)
  end

  def calculate_two(player)
    card1 = player.hand[0].value
    card1 = 11 if player.hand[0].name == 'A' && player.hand[1].name != 'A'
    card2 = player.hand[1].value
    card2 = 11 if player.hand[1].name == 'A'
    card2 = 1 if player.hand[1].name == 'A' && card1 == 11
    player.points = card1 + card2
  end

  def calculate_three(player)
    @card3 = player.hand[2].value
    @card3 = 11 if ace11?(player)
    @card3 = 1 if ace1?(player)
    player.points += @card3
  end

  def first_two_cards(player)
    take_two(player)
    what_first_two(@interface, player)
    calculate_two(player)
    player.points
    player.cash -= 10
  end

  def what_first_two(interface, player)
    interface.users_two(player) if player == @user
    interface.dealers_two if player == @dealer
  end

  def what_one_more(player)
    @interface.users_one_more(player) if player == @user
    @interface.dealers_one_more if player == @dealer
  end

  def ace11?(player)
    player.hand[2].name == 'A' && @start_sum + 11 < 21
  end

  def ace1?(player)
    player.hand[2].name == 'A' && @start_sum + 11 > 21
  end

  def one_more(player)
    take_card(player)
    what_one_more(player)
    calculate_three(player)
    player.hand[2].value = @card3
    player.hand[0].value = 1 if player.hand[0].value == 11 && @final_sum > 21
    player.hand[1].value = 1 if player.hand[1].value == 11 && @final_sum > 21
  end

  def start_game
    @interface.who_are_you
    @deck.create_deck
    @deck.shuffle!
    continue_game
  end

  def go_game
    first_two_cards(@user)
    first_two_cards(@dealer)
  end

  def continue_game
    go_game
    @bank += 20
    choose_next
  end

  def pass
    dealer_plays(@dealer)
  end

  def dealer_plays(dealer)
    return if start_sum(@dealer) > 17
    one_more(dealer) if start_sum(@dealer) < 17
  end

  def one_more_card
    one_more(@user)
  end

  def user_wins_cash
    @user.cash += @bank
    @bank -= 20
  end

  def user_lose_cash
    @dealer.cash += @bank
    @bank -= 20
  end

  def all_lose_cash
    @bank -= 20
    @user.cash += 10
    @dealer.cash += 10
  end

  def winner
    who_is_winner
  end

  def open_cards
    @interface.open_cards(@user, @dealer)
    winner
  end

  def choose_next
    @interface.menu(@user.points)
    loop do
      send TO_DO[@interface.menu_choice]
      open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
    end
  end

  def clear(player)
    @deck.cards << player.hand[0]
    player.hand.slice!(0)
    @deck.cards << player.hand[1]
    player.hand.slice!(1)
    @deck.cards << player.hand[2] unless player.hand[2].nil?
    player.hand.slice!(2)
    player.points = 0
  end

  def again
    clear(@user)
    clear(@dealer)
    @interface.play_again(@user)
    continue_game if @interface.next_game == true
  end
end
