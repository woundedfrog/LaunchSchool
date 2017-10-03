class GuessingGame
  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze
  
  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze
  
  def initialize(low, high)
    @range = (low..high)
    p @max_guess = Math.log2(high - low + 1).to_i + 1
    @secret_num = nil    
  end
  
  def play
    set_secret_number
    play_game
  end
  
  private
  
  def set_secret_number
    @secret_num  = rand(@range)
  end
  
  def play_game
    @max_guess.downto(1) do |guesses|
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
    max, low = @range.max, @range.min
    loop do
      puts "Please enter a number between #{low} and #{max}"
      answer = gets.chomp.to_i
      return answer if guess_is_valid?(answer)
    end
  end

  def guess_is_valid?(answer)
    return true if @range.include?(answer)
    puts "That number is outside of range."
    false
  end

end

game = GuessingGame.new(501, 1500)
game.play

#You have 10 guesses remaining.
#Enter a number between 501 and 1500: 104
#Invalid guess. Enter a number between 501 and 1500: 1000
#Your guess is too low
#
#You have 9 guesses remaining.
#Enter a number between 501 and 1500: 1250
#Your guess is too low
#
#You have 8 guesses remaining.
#Enter a number between 501 and 1500: 1375
#Your guess is too high
#
#You have 7 guesses remaining.
#Enter a number between 501 and 1500: 80
#Invalid guess. Enter a number between 501 and 1500: 1312
#Your guess is too low
#
#You have 6 guesses remaining.
#Enter a number between 501 and 1500: 1343
#Your guess is too low
#
#You have 5 guesses remaining.
#Enter a number between 501 and 1500: 1359
#Your guess is too high
#
#You have 4 guesses remaining.
#Enter a number between 501 and 1500: 1351
#Your guess is too high
#
#You have 3 guesses remaining.
#Enter a number between 501 and 1500: 1355
#You win!