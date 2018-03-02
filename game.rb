class Game
  attr_reader :user, :dealer
  attr_accessor :bank

  include Winner

  TO_DO = { 'P' => :pass, 'M' => :one_more_card, 'O' => :open_cards }.freeze

  def initialize(interface)
    @interface = interface
    @deck = Deck.new
    @user = User.new(@deck)
    @dealer = Dealer.new(@deck)
    @bank = 0
  end

  def first_two_cards(player)
    player.deck.take_two
    what_first_two(@interface, player)
    player.deck.calculate
    player.deck.write_cards(player)
    player.hand[0] = player.deck.first_card
    player.hand[1] = player.deck.second_card
    player.hand[2] = player.deck.third_card
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
    player.deck.card3[0] == 'A' && start_sum(player) + 11 < 21
  end

  def ace1?(player)
    player.deck.card3[0] == 'A' && start_sum(player) + 11 > 21
  end

  def one_more(player)
    player.deck.take_third
    what_one_more(player)
    player.deck.write_third(player)
    player.deck.third_card = 11 if ace11?(player)
    player.deck.third_card = 1 if ace1?(player)
    player.hand[2] = player.deck.third_card
    player.hand[0] = 1 if player.hand[0] == 11 && final_sum(player) > 21
    player.hand[1] = 1 if player.hand[1] == 11 && final_sum(player) > 21
    final_sum(player)
  end

  def final_sum(player)
    player.hand[0].to_i + player.hand[1].to_i + player.hand[2].to_i
  end

  def start_sum(player)
    player.hand[0].to_i + player.hand[1].to_i
  end

  def start_game
    @interface.who_are_you
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
    open_cards
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
    @interface.open_cards(@user, @dealer, final_sum(@user), final_sum(@dealer))
    winner
  end

  def choose_next
    @interface.menu(start_sum(@user))
    loop do
      send TO_DO[@interface.menu_choice]
      open_cards if @user.hand.size >= 3 || @dealer.hand.size >= 3
    end
  end

  def clear(player)
    player.hand.delete_at(0)
    player.hand.delete_at(1)
    player.hand.delete_at(2)
    player.cards.delete_at(0)
    player.cards.delete_at(1)
    player.cards.delete_at(2)
  end

  def again
    clear(@user)
    clear(@dealer)
    @interface.play_again(@user)
    continue_game if @interface.next_game == true
  end
end
