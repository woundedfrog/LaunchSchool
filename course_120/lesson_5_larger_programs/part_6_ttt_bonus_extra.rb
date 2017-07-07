require 'pry'

class String
  def yellow;         "\033[33m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def red;            "\e[41m#{self}\e[0m" end
end

module Displayable
  def bannerize(*message)
    puts(("=" * 80).cyan)
    center_message(*message)
    puts(("=" * 80).cyan)
  end

  def center_message(*message)
    message.each do |line|
      size = 40 - (line.size / 2)
      size = 0 if size < 0
      puts " " * size + line
    end
  end

  def colorize_yellow(string)
    puts string.center(80).yellow
  end

  def continue?(string)
    puts string.center(80).red
    gets
  end

  def display_welcome_message
    clear_screen
    bannerize("Welcome to Tic Tac Toe!")
    continue?("Press Enter to continue.")
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
    bannerize("Thank you for playing Tic Tac Toe! Goodbye!")
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    players = @players.map { |pl| pl.name }.join(" || ")
    pl_markers = @players.map { |pl| "Marker: #{pl.marker}" }.join(" || ")
    scores = @players.map { |pl| "score: #{pl.score}" }.join(" || ")
    bannerize(players, pl_markers, scores)
    board.draw
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when player1.marker
      bannerize("Player 1 won!")
    when player2.marker
      bannerize("Player 2 won!")
    else
      bannerize("It's a tie!")
    end
    continue?("Press Enter to continue!")
  end

  def display_play_again_message
    bannerize("Let's play again!")
    continue?("Press Enter to continue!")
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end
end

class Board
  attr_reader :board_size
  include Displayable
  #WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
  #                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
  #                [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    @square_num, @board_size = choose_board_size
    @winning_lines = winning_lines
    reset
  end

  def draw_squares(lines, sqr_num)
    square_row = []
    sqr_num.upto(lines) do |num|
      square_row << "  #{@squares[num]}  "
    end
    puts square_row.join("|") # .center(80)
  end

  def draw_verticals(lines)
    row = []
    lines.times do
      row << "     "
    end
    puts row.join("|") # .center(80)
  end

  def draw_border_line(lines)
    row = []
    lines.times do
      row << "-----"
    end
    puts row.join("+") # .center(80)
  end

  def draw
    lines = @board_size
    sqr_num = 1
    puts ""
    1.upto(lines) do |count|
      draw_verticals(lines)
      draw_squares((lines * count), sqr_num)
      draw_verticals(lines)
      draw_border_line(lines) unless count == lines
      sqr_num += lines
    end
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

  def additional_rows(rows, size)
    if size == 5
      [[1, 7, 13, 19], [5, 11, 17, 23], [3, 7, 11, 15], [9, 13, 17, 21]]
    elsif size == 9
      (1...5).flat_map do |x|
        [ (x...size).map     { |i| rows[i][i - x]},
          (x...size).map     { |i| rows[i][-i + x - 1]},
          (0...size - x).map { |i| rows[i][i + x]},
          (0...size - x).map { |i| rows[i][-x - 1 - i]} ]
      end
    else
      []
    end
  end

  def calculate_win_rows(arr, size)
    arr.each_slice(size).to_a
  end

  def calculate_win_diagonals(rows, size)
    [(0...size).map { |i| rows[i][i] },
     (0...size).map { |i| rows[i][size - 1 - i] }] +
     additional_rows(rows, size)
  end

  def calculate_win_cols(rows, size)
    rows.first.zip(*rows[1..-1])
  end

  def winning_lines
    size = @board_size
    sq_nums = (1..size**2).to_a
    rows = calculate_win_rows(sq_nums, size)
    cols = calculate_win_cols(rows, size)
    diagonals = calculate_win_diagonals(rows, size)
    rows + cols + diagonals
    #stepper = 1
    #lines = []
    #1.upto(size) do |n|
    #  bingo = []
    #  (1..size).step(stepper).each do |square|
    #    bingo << square
    #  end
    #  lines << bingo
    #  stepper += size
    #end
  end

  def win_score
    case board_size
    when 3 then 3
    when 5 then 4
    when 9 then 5
    end
  end

  def risked_square(pl_marker)
    @winning_lines.each do |line|
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
    @winning_lines.each do |line|
      squares = @squares.values_at(*line)
      p bingo_line?(squares)
      return bingo_line?(squares)
    end
  end

  def reset
    (1..@square_num).each { |key| @squares[key] = Square.new }
  end

  private

  def choose_board_size
    answer = nil
    puts "Choose a board size: (1, 2, or 3)"
    puts "(1): 3x3 - matches needed => 3"
    puts "(2): 5x5 - matches needed => 4"
    puts "(3): 9x9 - matches needed => 5"
    loop do
      answer = gets.chomp.to_i
      break if [1, 2, 3].include?(answer)
      puts "That's not a valid option!"
    end
    grids = [[nil], [9, 3], [25, 5], [81, 9]]
    grids[answer]
  end

  def bingo_line?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
     #if markers.size != win_score
    if markers.any? { |x| markers.count(x) == win_score }
      return markers.find { |x| markers.count(x) == win_score }
    else
      return false
    end
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
  include Displayable

  attr_reader :marker, :name, :score
  attr_writer :score

  @@used_markers = []
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
    choice = ''
    loop do
      puts "Choose a player marker."
      choice = gets.chomp.upcase
      if choice != '' && choice.size == 1 && !@@used_markers.include?(choice)
        @@used_markers << choice
        break
      end
      puts "That's not a valid input."
    end
    choice
  end

  def move(players, board)
    human_player = players[0]
    bannerize("Choose a square (#{joinor(board.unmarked_keys)}): ")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry not a valid choice."
    end
    board[square].marker = human_player.marker
  end
end

class Computer < Player
  def initialize
    super()
    @marker = choose_marker
  end

  def select_name
    ["Benny", "Timmy", "Mr. Biggles"].sample
  end

  def choose_marker
    loop do
      choice = ['O', 'V', 'C', 'B', '*'].sample
      @@used_markers.include?(choice) ? next : @@used_markers << choice
      return choice
    end
  end

  def move(players, board)
    player1 = players[0].marker
    players.drop(1).each do |player|
      player2 = player.marker
      # offensive
      square = offensive_move(player1, board)
      # deffensive
      square = defensive_move(player2, board) if square.nil?
      return board[square] = player1 if !square.nil?
    end
    # middle if possible, else random
    return board[5] = player1 if board[5].marker == " "
    board[board.unmarked_keys.sample] = player1
  end

  def offensive_move(player2, board)
    board.risked_square(player2)
  end

  def defensive_move(player1, board)
    board.risked_square(player1)
  end
end

class TTTGame
  include Displayable

  attr_reader :board, :player1, :player2, :win_score

  def initialize
    display_welcome_message
    @board = Board.new
    @win_score = board.win_score
    @players = player_num_and_type
    @current_player = player_info
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

  def player_num_and_type
    answer = nil
    puts "Please choose the number of players and types: (1 - 4)"
    loop do
      puts "(1): 2 Players: human & computer"
      puts "(2): 2 Players: human & human"
      puts "(3): 2 Players: computer & computer"
      puts "(4): 2 Players: human, human, & computer"
      answer = gets.chomp.to_i
      break if [1, 2, 3, 4].include?(answer)
      puts "That's not a valid input!"
    end
    initialize_players(answer)
  end

  def initialize_players(answer)
    player =
      case answer
      when 1 then [@player1 = Human.new, @player2 = Computer.new]
      when 2 then [@player1 = Human.new, @player2 = Human.new]
      when 3 then [@player1 = Computer.new, @player2 = Computer.new]
      else [@player1 = Human.new, @player2 = Human.new, @player3 = Computer.new]
      end
    player
  end

  def player_info
    @players.map do |player|
      player
    end
  end

  def current_player_moves
    turns = @current_player
    players = @current_player
    current_player = @current_player[0]
    current_player.move(players, board) if players[0].instance_of?(Human)
    current_player.move(players, board) if players[0].instance_of?(Computer)
    @current_player = turns[1..-1] + [turns[0]]
    clear_screen_and_display_board
  end

  def update_scores(marker)
    return if marker.nil?
    player1.marker == marker ? player1.score_update : player2.score_update
  end

  def score_limit_reached?
    if player1.score == 3
      bannerize("Congrats! Player 1 is the winner!")
      continue?("Press Enter to continue.")
      return true
    elsif player2.score == 3
      bannerize("Congrats! Player 2 is the winner!")
      continue?("Press Enter to continue.")
      return true
    end
    false
  end

  def play_again?
    answer = nil
    loop do
      bannerize("Would you like to play again? (y/n)")
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end

    return if answer == 'n'
    display_play_again_message
    player1.score = 0
    player2.score = 0
    true
  end

  def game_reset
    board.reset
    @current_player = @players
    clear_screen
  end
end

game = TTTGame.new
game.play
