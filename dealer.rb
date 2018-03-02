class Dealer < Player
  attr_reader :cash

  def what_first_two
    puts 'Dealer cards'
    puts '*'
    puts '*'
  end

  def what_one_more
    puts 'Dealer take one more card'
  end

  def dealer_plays
    return if start_sum > 17
    one_more if start_sum < 17
  end
end
