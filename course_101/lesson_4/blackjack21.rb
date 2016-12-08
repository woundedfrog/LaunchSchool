CHOICES = %w(h hit s stay).freeze
HIT = CHOICES[0..1].freeze
STAY = CHOICES[2..3].freeze

def initialize_deck
  [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'],
   ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],
   ['H', 'Q'], ['H', 'K'], ['H', 'A'], ['D', '2'], ['D', '3'],
   ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'],
   ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'],
   ['D', 'A'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'],
   ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'],
   ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A'], ['S', '2'],
   ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'],
   ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'],
   ['S', 'K'], ['S', 'A']]
end

def prompt(message)
  puts "==>> #{message}"
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
#      if sum > 21
#        sum -= 10  #my own code. If work, delete 'correct for aces'
#      end
    elsif value.to_i == 0 # J, Q, K  if value == "J", etc
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end