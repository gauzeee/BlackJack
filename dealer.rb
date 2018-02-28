class Dealer < Player
  attr_reader :cash

  def what_first_two_cards
    puts 'Dealer cards'
    puts '*'
    puts '*'
  end

  def what_one_more
    puts 'Dealer got one more card'
  end

  def dealer_plays
    return if start_sum > 17
    one_more if start_sum < 17
  end
end
