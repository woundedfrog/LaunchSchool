########################################
#          DISPLAY MESSAGES
########################################

module Displayable
  private

  def bannerize(*message)
    puts(cyan("=" * 80))
    center_message(*message)
    puts(cyan("=" * 80))
  end

  def center_message(*message)
    message.each do |line|
      line = line.gsub(/\e\[\d+\m/, "")
      size = 40 - (line.size / 2)
      size = 0 if size < 0
      puts " " * size + line
    end
  end

  def colorize_yellow(string)
    puts yellow(string.center(80))
  end

  def yellow(string)
    "\033[33m#{string}\033[0m"
  end

  def cyan(string)
    "\033[36m#{string}\033[0m"
  end

  def red(string)
    "\e[41m#{string}\e[0m"
  end

  def continue?(string)
    puts red(string.center(80))
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
    players = @players.map(&:name).join(" || ")
    pl_markers = @players.map { |pl| "Marker: #{pl.marker}" }.join(" || ")
    scores = @players.map { |pl| "score: #{pl.score}" }.join(" || ")
    bannerize(players, pl_markers, scores)
    board.draw
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when player1.marker
      bannerize("Player 1: #{player1.name} won!")
    when player2.marker
      bannerize("Player 2: #{player2.name} won!")
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

########################################
#        SquareSearcher MODULE
########################################

module SquareSearcher
  private

  def risk_line(pl_marker, alternate_mark, defence)
    counter = defence == true ? 3 : 2
    counter.times do |num|
      @winning_lines.each do |line|
        all_markers = @squares.values_at(*line).map(&:marker)
        next if (all_markers - alternate_mark).count < win_score
        if all_markers.count(pl_marker) >= (win_score - 1 - num)
          risked_square = scan_line_for_bingo(pl_marker, line)
        end
        return risked_square if !risked_square.nil?
      end
    end
    nil
  end

  def scan_line_for_bingo(pl_marker, line)
    size = win_score - 1
    size = win_score if win_score == 5
    size.times do |i|
      line.each_cons(win_score) do |bingo|
        square_values = @squares.values_at(*bingo).map(&:marker)
        if confirm_mark_count_and_grouping(pl_marker, square_values, i)
          square = valid_bingo_square(bingo)
        end
        return square if !!square
      end
    end
    nil
  end

  def confirm_mark_count_and_grouping(pl_marker, square_values, i)
    return true if square_values.count(pl_marker) >= (win_score - i) &&
                   square_values.uniq.size == 2 &&
                   square_values.uniq.include?(" ") &&
                   square_values.uniq.include?(pl_marker)
    nil
  end

  def valid_bingo_square(bingo)
    bingo.size.times do |i|
      bingo.each_cons(bingo.size - i) do |x|
        if @squares.values_at(*x).map(&:marker).count(" ") == 1
          return x.find { |key| @squares[key].marker == " " }
        end
      end
    end
    nil
  end

  def bingo_line?(squares)
    marks = squares.map(&:marker)
    result = nil
    marks.uniq.each do |pl|
      next if pl == " "
      marks.each_cons(win_score) do |row|
        if marker_is_uniq?(row, pl)
          result = pl
        end
        return result if result
      end
    end
    result
  end

  def marker_is_uniq?(row, pl)
    row.uniq.size == 1 && !row.uniq.include?(" ") &&
      row.uniq.include?(pl)
  end

  def return_marker(squares)
    bingo_line?(squares)
  end
end

########################################
#             BOARD Class
########################################

class Board
  include SquareSearcher
  include Displayable

  attr_reader :board_size, :win_score

  def initialize
    @squares = {}
    @squares_total, @board_size = choose_board_size
    @winning_lines = winning_lines
    @win_score = win_score
    reset
  end

  def draw
    lines = @board_size
    sqr_num = 1
    puts ""
    1.upto(lines) do |count|
      draw_verticals(lines, " ")
      draw_squares((lines * count), sqr_num)
      draw_verticals(lines * count, sqr_num)
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

  def win_score
    case board_size
    when 3 then 3
    when 5 then 4
    when 9 then 5
    end
  end

  def risked_square(pl_marker, used_markers, defence)
    alternate_mark = used_markers - [pl_marker]
    risk_line(pl_marker, alternate_mark, defence)
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    @winning_lines.each do |line|
      line_values = @squares.values_at(*line)
      if !!bingo_line?(line_values)
        return return_marker(line_values)
      end
    end
    nil
  end

  def reset
    (1..@squares_total).each { |key| @squares[key] = Square.new }
  end

  private

  def choose_board_size
    answer = nil
    puts yellow("Choose a board size: (1, 2, or 3)")
    puts "(1): 3x3 - matches needed => 3"
    puts "(2): 5x5 - matches needed => 4"
    puts "(3): 9x9 - matches needed => 5"
    loop do
      answer = gets.chomp.to_i
      break if [1, 2, 3].include?(answer)
      puts "That's not a valid option!"
    end
    grids = [[9, 3], [25, 5], [81, 9]]
    grids[answer - 1]
  end

  def draw_squares(lines, sqr_num)
    square_row = []
    sqr_num.upto(lines) do |num|
      square_row << "  #{@squares[num]}  "
    end
    puts square_row.join("|").center(80)
  end

  def draw_num_and_verticles(lines, sqr_num, row)
    sqr_num.upto(lines) do |num|
      row << if @squares[num].marker == " "
               "#{(' ' * (5 - num.to_s.size))}#{num}"
             else
               "     "
             end
    end
  end

  def draw_verticals(lines, sqr_num)
    row = []
    if sqr_num == " "
      1.upto(lines) { row << "     " }
    else
      draw_num_and_verticles(lines, sqr_num, row)
    end
    puts cyan(row.join("|").center(80))
  end

  def draw_border_line(lines)
    row = []
    lines.times do
      row << "-----"
    end
    puts row.join("+").center(80)
  end

  # rubocop:disable Metrics/AbcSize
  def additional_rows(rows, size)
    if size == 5
      [[10, 14, 18, 22], [6, 12, 18, 24], [2, 8, 14, 20], [4, 8, 12, 16]]
    elsif size == 9
      (1...5).flat_map do |x|
        [(x...size).map { |i| rows[i][i - x] },
         (x...size).map { |i| rows[i][-i + x - 1] },
         (0...size - x).map { |i| rows[i][i + x] },
         (0...size - x).map { |i| rows[i][-x - 1 - i] }]
      end
    else
      []
    end
  end

  def winning_lines
    size = board_size
    sq_nums = (1..size**2).to_a
    rows = calculate_win_rows(sq_nums, size)
    cols = calculate_win_cols(rows)
    diagonals = calculate_win_diagonals(rows, size)
    rows + cols + diagonals
  end

  # rubocop:enable Metrics/AbcSize
  def calculate_win_rows(arr, size)
    arr.each_slice(size).to_a
  end

  def calculate_win_diagonals(rows, size)
    [(0...size).map { |i| rows[i][i] },
     (0...size).map { |i| rows[i][size - 1 - i] }] +
      additional_rows(rows, size)
  end

  def calculate_win_cols(rows)
    rows.first.zip(*rows[1..-1])
  end
end

########################################
#             SQUARE Class
########################################

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

########################################
#             PLAYER Class
########################################

class Player
  include Displayable

  attr_reader :marker, :name, :score
  attr_writer :score

  @@used_markers = []

  def initialize
    @name = select_name
    @score = 0
  end

  def used_markers
    @@used_markers
  end

  def score_update
    @score += 1
  end
end

########################################
#             HUMAN Class
########################################

class Human < Player
  def initialize
    super
    @marker = choose_marker
  end

  def select_name
    loop do
      puts yellow("Enter your name!")
      answer = gets.chomp.capitalize
      return answer unless answer == ''
      puts "Enter a valid name!"
    end
  end

  def choose_marker
    choice = ''
    loop do
      puts yellow("Choose a player marker.")
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
    human_player = players[0].marker
    bannerize("Choose a square (#{joinor(board.unmarked_keys)}): ")
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry not a valid choice."
    end
    board[square] = human_player
  end
end

########################################
#             COMPUTER Class
########################################

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
      choice = ['O', 'T', 'M', 'B', '*'].sample
      @@used_markers.include?(choice) ? next : @@used_markers << choice
      return choice
    end
  end

  def move(players, board)
    sleep 0.2
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
    middle = choose_center_square(player1, board)
    board[board.unmarked_keys.sample] = player1 if middle.nil?
  end

  def offensive_move(player2, board)
    board.risked_square(player2, @@used_markers, false)
  end

  def defensive_move(player1, board)
    board.risked_square(player1, @@used_markers, true)
  end

  def choose_center_square(player1, board)
    size = board.board_size
    case size
    when 3 then board[5] = player1 if board[5].marker == " "
    when 5 then board[13] = player1 if board[13].marker == " "
    else board[41] = player1 if board[41].marker == " "
    end
  end
end

########################################
#            GAME Class
########################################

class TTTGame
  include Displayable

  WIN_LIMIT = 3

  attr_reader :board, :player1, :player2, :win_score

  def initialize
    display_welcome_message
    @board = Board.new
    @win_score = board.win_score
    @players = player_count_and_type
    @current_player = @players
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

  def player_count_and_type
    answer = nil
    puts yellow("Please choose the number of players and types: (1 - 4)")
    loop do
      puts "(1): 2 Players: human & computer"
      puts "(2): 2 Players: human & human"
      puts "(3): 2 Players: computer & computer"
      puts "(4): 3 Players: human, human, & computer"
      answer = gets.chomp.to_i
      break if [1, 2, 3, 4].include?(answer)
      puts "That's not a valid input!"
    end
    initialize_players(answer)
  end

  def initialize_players(answer)
    case answer
    when 1 then [@player1 = Human.new, @player2 = Computer.new]
    when 2 then [@player1 = Human.new, @player2 = Human.new]
    when 3 then [@player1 = Computer.new, @player2 = Computer.new]
    else [@player1 = Human.new, @player2 = Human.new, @player3 = Computer.new]
    end
  end

  def current_player_moves
    puts  "#{@current_player[0].name}'s move".center(80)
    turns = @current_player
    @current_player[0].move(@current_player, board)

    @current_player = turns[1..-1] + [turns[0]]
    clear_screen_and_display_board
  end

  def update_scores(marker)
    return if marker.nil?
    player1.marker == marker ? player1.score_update : player2.score_update
  end

  def score_limit_reached?
    if player1.score == WIN_LIMIT
      bannerize("Congrats! Player 1 is the winner!")
      continue?("Press Enter to continue.")
      return true
    elsif player2.score == WIN_LIMIT
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
