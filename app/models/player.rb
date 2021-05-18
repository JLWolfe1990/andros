class Player
  attr_accessor :hand, :dealer

  def initialize(opts={})
    @dealer = opts[:dealer]
    @hand = Hand.new
  end

  def pass_in_cards!
    @hand = Hand.new
  end
end