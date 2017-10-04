class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    create_deck
  end

  
  def draw
    create_deck if @deck.empty?
    @deck.pop
  end 
  
  private

  def create_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    @deck = cards.shuffle!
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable
  
  VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14}
  SUITS_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    VALUES.fetch(@rank, @rank) + SUITS_VALUES[suit]
  end

  def <=>(other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw}
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.

100000.times do |x|
  drawn3 = []
  52.times { drawn3 << deck.draw }
  drawn != drawn3
  print "#{x} #{drawn != drawn3} "
  break if drawn == drawn3
end