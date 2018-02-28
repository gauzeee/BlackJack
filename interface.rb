module Interface
  TO_DO_POINTS = [
    'Enter 1, to PASS', 'Enter 2, to get ONE more card',
    'Enter 3, to OPEN cards'
  ].freeze

  TO_DO = { '1' => :pass, '2' => :one_more, '3' => :open_cards }.freeze

  def pass
    dealer_plays
  end

  def open_cards; end
end
