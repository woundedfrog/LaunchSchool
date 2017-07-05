require 'pry'

class String
  def yellow;         "\033[33m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
end

module Displayable
  def format_display(*message)
    puts(("=" * 80).cyan)
    center_message(*message)
    puts(("=" * 80).cyan)
  end

  def center_message(*message)
    message.each do |line|
      puts " " * (40 - (line.size / 2)) + line
    end
  end

  def colorize_yellow(string)
    puts string.center(80).yellow
  end

  def colorize_red(string)
    puts string.center(80).red
  end

  def display_welcome_message
    clear_screen
    format_display("Welcome to Tic Tac Toe!")
    colorize_red("Press Enter to continue.")
    gets.chomp
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def display_goodbye_message
    format_display("Thank you for playing Tic Tac Toe! Goodbye!")
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    players = "#{human.name}: | #{computer.name}:"
    player_markers = "marker: #{human.marker} | marker: #{computer.marker}"
    scores = "score: #{human.score} | score: #{computer.score}"
    format_display(players, player_markers, scores)
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
    colorize_red("Press Enter to continue!")
    gets.chomp
  end

  def display_play_again_message
    format_display("Let's play again!")
    colorize_red("Press Enter to continue!")
    gets.chomp
  end

  def clear_screen
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
    colorize_yellow("     |     |     ")
    colorize_yellow("  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  ")
    colorize_yellow("     |     |     ")
    colorize_yellow("-----+-----+-----")
    colorize_yellow("     |     |     ")
    colorize_yellow("  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  ")
    colorize_yellow("     |     |     ")
    colorize_yellow("-----+-----+-----")
    colorize_yellow("     |     |     ")
    colorize_yellow("  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  ")
    colorize_yellow("     |     |     ")
    puts ""
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def [](num)
    @squares[num]
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def risked_square(pl_marker)
    WINNING_LINES.each do |line|
      if line.count { |num| @squares[num].marker == pl_marker } == line.size - 1
        return line.find { |key| @squares[key].marker == " " }
      end
    end
    nil
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
  attr_reader :marker, :name, :score
  attr_writer :score

  def initialize
    @name = select_name
    @score = 0
  end

  def score_update
    @score += 1
  end
end

class Human < Player
  def initialize
    super
    @marker = choose_marker
  end

  def select_name
    loop do
      puts "Enter your name!"
      answer = gets.chomp.capitalize
      return answer unless answer == ''
      puts "Enter a valid name!"
    end
  end

  def choose_marker
    marker = ''
    loop do
      puts "Choose a player marker."
      marker = gets.chomp.upcase
      break if marker != '' && marker.size == 1
      puts "That's not a valid input."
    end
    marker
  end
end

class Computer < Player
  def initialize(marker)
    super()
    @marker = choose_marker(marker)
  end

  def select_name
    ["Benny", "Timmy", "Mr. Biggles"].sample
  end

  def choose_marker(marker)
    loop do
      mark = ['O', 'V', 'C', 'B', '*'].sample
      return mark unless mark == marker
    end
  end
end

class TTTGame
  include Displayable

  WIN_SCORE = 3

  attr_reader :board, :human, :computer

  def initialize
    display_welcome_message
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(human.marker)
    @player_one = human.marker
    @current_marker = [human.marker, computer.marker]
  end

  def play
    clear_screen
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
      end
      update_scores(board.winning_marker)
      display_result
      if score_limit_reached?
        break unless play_again?
      end
      game_reset
    end
    display_goodbye_message
  end

  private

  def current_player_moves
    if human_turn?
      human_moves
    else
      computer_moves
    end
    @current_marker.reverse! unless board.someone_won? || board.full?
    clear_screen_and_display_board
  end

  def human_turn?
    @current_marker.first == human.marker
  end

  def human_moves
    format_display("Choose a square (#{joinor(board.unmarked_keys)}): ")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry not a valid choice."
    end
    board[square].marker = human.marker
  end

  def computer_moves
    # offensive
    square = find_risk_square(computer.marker)
    # defencive
    square = find_risk_square(human.marker) if square.nil?
    if !square.nil?
      board[square] = computer.marker
    else
      # middle if possible, else random
      return board[5] = computer.marker if board[5].marker == " "
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def find_risk_square(pl_marker)
    board.risked_square(pl_marker)
  end

  def update_scores(marker)
    return if marker.nil?
    human.marker == marker ? human.score_update : computer.score_update
  end

  def score_limit_reached?
    if human.score == 3
      format_display("Congrats! You beat the computer!")
    else
      format_display("Too bad! The computer won!")
    end
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def play_again?
    answer = nil
    clear_screen
    loop do
      center_message("Would you like to play again? (y/n)")
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end

    return if answer == 'n'
    display_play_again_message
    human.score = 0
    computer.score = 0
    true
  end

  def game_reset
    board.reset
    @current_marker = [human.marker, computer.marker]
    clear_screen
  end
end

game = TTTGame.new
game.play
