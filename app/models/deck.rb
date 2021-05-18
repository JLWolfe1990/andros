class Deck
  def initialize
    @cards = []

    Card::SUITES.each do |suit|
      Card::TYPE_AND_VALUES.each do |type, value|
        @cards << { suit: suit, type: type, value: value }
      end
    end
  end

  def draw
    @cards.delete_at(Random.rand(@cards.length - 1))
  end
end