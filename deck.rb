class Deck
  #include CardsCalc

  SUITS = ['♡', '♢', '♤', '♧'].freeze
  NAMES = %w[2 3 4 5 6 7 8 9 A J Q K].freeze
  VALUES = [ 2, 3, 4, 5, 6, 7, 8, 9, 1, 10, 10, 10 ].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  def create_deck
    SUITS.each do |suit|
      NAMES.each_with_index do |name, index|
        @cards << Card.new(name, suit, VALUES[index])
      end
    end
  end

  def show_deck
    @cards.each { |name| puts "#{name.name} #{name.suit} #{name.value}" }
  end
end
