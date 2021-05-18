class Game
  def initialize()
    @players = []

    5.times do
      @players << Player.new
    end

    @players << Player.new(dealer: true)

    print_rules
  end

  def play!
    puts "Are you ready to play? (yes/no)"
    answer = gets
    ready = answer.strip == 'yes'

    if ready
      @deck = Deck.new
      deal!

      @scores = @players.collect { |p| p.hand.score }

      announce_winners!
      shuffle!
      play!
    end
  end

  private

  def announce_winners!
    score_to_beat = @scores.max

    dealer_score = @scores[4]
    puts "The dealer scores #{dealer_score}"
    if @scores[4] == score_to_beat
      puts "The dealer wins"
    else

      @scores[0..3].each_with_index do |score, i|
        puts "Player #{i + 1} beat the dealer with a score of #{score}" if score > dealer_score
      end
    end
  end

  def deal!
    2.times do
      @players.each do |player|
        player.hand.add_card(@deck.draw)
      end
    end
  end

  def print_rules
    puts "Rules:"
    puts "Everyone gets 2 cards. Aces are always low. Dealer wins a push."
    puts "The goal is to beat the dealer. If you do, I'll announce it."
  end

  def shuffle!
    @players.each(&:pass_in_cards!)
  end
end