class Card
  attr_accessor :suit, :type
  SUITES = ['hearts', 'spades', 'clubs', 'diamonds'].freeze # quick and dirty enum
  TYPE_AND_VALUES = {
      'A' => 1,
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 10,
      '10' => 10,
      'J' => 10,
      'Q' => 10,
      'K' => 10,
    }.freeze

  def value
    TYPE_AND_VALUES[@type]
  end
end