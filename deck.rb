class Deck

  SUITS = ['♡', '♢', '♤', '♧'].freeze
  NAMES = %w[2 3 4 5 6 7 8 9 A J Q K].freeze
  VALUES = [ 2, 3, 4, 5, 6, 7, 8, 9, 1, 10, 10, 10 ].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def create_deck
    NAMES.each_with_index do |name, index|
      SUITS.each do |suit|
        @cards << Card.new(name, suit, VALUES[index])
      end
    end
  end

  def mix_deck
    @cards.shuffle!
  end
end
