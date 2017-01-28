system "clear"

SUITS = ['♥', '♦', '♠', '♣']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
BLACKJACK = 21
DEALERLIMIT = 17

def prompt(message)
  puts "==>> #{message}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
      if sum > BLACKJACK
        sum -= 10
      end
    elsif value.to_i.zero? #== 0 # J, Q, K  if value == "J", etc
      sum += 10
    else
      sum += value.to_i
    end
  end

  sum
end

def busted?(cards)
  total(cards) > BLACKJACK
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > BLACKJACK
    :player_busted
  elsif dealer_total > BLACKJACK
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def game_over_message(player_score, dealer_score)
  winner = if player_score > dealer_score
             'You'
           else
             'Dealer'
           end
  puts ""
  prompt "Your score is: #{player_score} / Dealer's score is: #{dealer_score}"
  prompt "Game over. #{winner} won!"
  puts ""
end

def play_again?
  loop do
    puts "Do you want to play again? ('y' or 'n')"
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else
      puts "Not a valid choice."
    end
  end
end

player_score = 0
dealer_score = 0

loop do
  system "clear"
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  prompt "Welcome to Back-Jack / Twenty-One!"
  prompt "There are 3 rounds."
  prompt "Your score is: #{player_score} / Dealer score is: #{dealer_score}"
  puts ""

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}. A total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn_answer = nil
    loop do
      prompt "Do you want to hit or stay? ('h' or 's')"
      player_turn_answer = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn_answer)
      prompt "Sorry, please enter 'h' or 's'."
    end

    if player_turn_answer == 'h'
      player_cards << deck.pop
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn_answer == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= DEALERLIMIT

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_result(dealer_cards, player_cards)
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # Compare cards
  puts "-------------"
  puts ''
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts ''
  puts "-------------"

  case detect_result(player_cards, dealer_cards)
  when :player, :dealer_busted
    dealer_score += 1
  when :dealer, :player_busted
    player_score += 1
  end
  display_result(dealer_cards, player_cards)

  if player_score == 3 || dealer_score == 3
    game_over_message(player_score, dealer_score)
    if play_again?
      player_score = 0
      dealer_score = 0
    else
      break
    end
  else
    prompt "Your score is: #{player_score} / Dealer score is: #{dealer_score}"
    prompt "Press any key to continue"
    gets
  end
end

prompt "Thanks for playing Black-Jack / Twenty-One! Bye-bye!"
