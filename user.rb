class User < Player
  attr_reader :cash

  def what_first_two
    puts 'Your cards'
    show_two
  end

  def what_one_more
    puts "Now you have #{@card3[0].to_s + @card3[1].to_s}"
  end
end
