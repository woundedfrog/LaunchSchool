#Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

class GuessingGame
  GUESS_LIMIT = 7
  NUMBER_RANGE = 1..100
  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze
  
  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze
  
  def initialize
    @secret_num = nil    
  end
  
  def play
    set_secret_number
    play_game
  end
  
  private
  
  def set_secret_number
    @secret_num  = rand(NUMBER_RANGE)
  end
  
  def play_game
    GUESS_LIMIT.downto(1) do |guesses|
      display_guess_counter(guesses)
      answer = guess_number
      result = check_guess_vs_actual_number(answer)
      break if result == :match
      if guesses - 1 == 0
        puts "You have 0 guesses left. Game over!"
      end
    end
  end
  
  def display_guess_counter(guesses)
    puts "You have #{guesses} left."
  end
  
  def check_guess_vs_actual_number(answer)
    case
      when answer == @secret_num
        puts RESULT_OF_GUESS_MESSAGE[:match]
      when answer > @secret_num
        puts RESULT_OF_GUESS_MESSAGE[:high]
      when answer < @secret_num
        puts RESULT_OF_GUESS_MESSAGE[:low]
    end
  end
  
  def guess_number
    loop do
      puts "Please enter a number between 1 and 100"
      answer = gets.chomp.to_i
      return answer if guess_is_valid?(answer)
    end
  end

  def guess_is_valid?(answer)
    return true if NUMBER_RANGE.include?(answer)
    puts "That number is outside of range."
    false
  end

end

game = GuessingGame.new
game.play

#You have 7 guesses remaining.
#Enter a number between 1 and 100: 104
#Invalid guess. Enter a number between 1 and 100: 50
#
#
#You have 6 guesses remaining.
#Enter a number between 1 and 100: 75
#Your guess is too low
#
#You have 5 guesses remaining.
#Enter a number between 1 and 100: 85
#Your guess is too high
#
#You have 4 guesses remaining.
#Enter a number between 1 and 100: 0
#Invalid guess. Enter a number between 1 and 100: 80
#
#You have 3 guesses remaining.
#Enter a number between 1 and 100: 81
#You win!
#
#game.play
#
#You have 7 guesses remaining.
#Enter a number between 1 and 100: 50
#Your guess is too high
#
#You have 6 guesses remaining.
#Enter a number between 1 and 100: 25
#Your guess is too low
#
#You have 5 guesses remaining.
#Enter a number between 1 and 100: 37
#Your guess is too high
#
#You have 4 guesses remaining.
#Enter a number between 1 and 100: 31
#Your guess is too low
#
#You have 3 guesses remaining.
#Enter a number between 1 and 100: 34
#Your guess is too high
#
#You have 2 guesses remaining.
#Enter a number between 1 and 100: 32
#Your guess is too low
#
#You have 1 guesses remaining.
#Enter a number between 1 and 100: 32
#Your guess is too low
#You are out of guesses. You lose.