require 'pry'

class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def yellow;         "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
end

module Displayable
  def format_display(message)
    puts ("=" * 80).cyan
    center_message(message)
    puts ("=" * 80).cyan
  end

  def center_message(message)
    puts message.center(80)
  end

  def colorize(string)
    puts string.center(80).yellow
  end

  def display_welcome_message
    clear
    format_display("Welcome to Tic Tac Toe!")
    center_message("Press any key to continue.")
    gets.chomp
  end

  def display_goodbye_message
    format_display("Thank you for playing Tic Tac Toe! Goodbye!")
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    format_display("#{human.name} is #{human.marker} | #{computer.name} is #{computer.marker}")
    board.draw
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      format_display("You won!")
    when computer.marker
      format_display("Computer won!")
    else
      format_display("It's a tie!")
    end
  end

  def display_play_again_message
    format_display("Let's play again!")
  end

  def clear
    (system 'clear') || (system 'cls')
  end
end

class Board
  include Displayable
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize

  def draw
    puts ""
    colorize("     |     |     ")
    colorize("  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  ")
    colorize("     |     |     ")
    colorize("-----+-----+-----")
    colorize("     |     |     ")
    colorize("  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  ")
    colorize("     |     |     ")
    colorize("-----+-----+-----")
    colorize("     |     |     ")
    colorize("  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  ")
    colorize("     |     |     ")
    puts ""
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)

      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    # @squares = Hash.new(Square.new(INITIAL_MARKER))
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor  :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker, :name

  def initialize(marker)
    @marker = marker
    @name = select_name
  end
end

class Human < Player
  def select_name
    #loop do
      puts "Enter your name!"
      answer = gets.chomp.capitalize
      #return answer unless answer == ''
      #puts "Enter a valid name!"
    #end
  end
end

class Computer < Player
  def select_name
    ["Benny", "Timmy", "Mr. Biggles"].sample
  end
end

class TTTGame
  include Displayable

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    display_welcome_message
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play    
    clear

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end

      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private


  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    format_display("Choose a square (#{board.unmarked_keys.join(', ')}): ")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end



  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

end

game = TTTGame.new
game.play
