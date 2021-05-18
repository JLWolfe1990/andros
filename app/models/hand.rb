class Hand
  def initialize
    @cards = []
  end

  def add_card(card)
    raise 'Too many cards' if @cards.length > 1
    @cards << card
  end

  def to_s
    ['I have a ', @cards.first.to_s, ' and a ', @cards.last.to_s, ' for a total of ', value]
  end

  def score
    @cards.inject(0) { |mem, card| mem + card[:value] }
  end
end