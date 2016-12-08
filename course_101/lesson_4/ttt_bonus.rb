require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]].freeze # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'cls'
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd), ', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = offensive_move(brd)
  square = defensive_move(brd) unless square
  square = advantage_square_five(brd) unless square
  square = empty_squares(brd).sample unless square

  brd[square] = COMPUTER_MARKER
end

def offensive_move(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def defensive_move(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def find_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def advantage_square_five(brd)
  5 if brd[5] == INITIAL_MARKER
end

def who_first
  answer = ''
  loop do
    prompt "Choose first player: ('p' for player, 'c' for computer):"
    answer = gets.chomp.downcase
    break if answer == "p" || answer == "c"
    prompt "Please input p or c."
  end

  if answer == "p"
    "Player"
  else
    "Computer"
  end
end

def place_piece!(brd, current_player)
  if current_player == "Player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == "Player"
    "Computer"
  else
    "Player"
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def show_results(player, computer)
  if player > computer
    prompt "You are winning #{player}:#{computer}!"
  elsif player < computer
    prompt "You are losing #{player}:#{computer}!"
  else prompt "You are tied #{player}:#{computer}!"
  end
end

def exit_game?
  answer = ''
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt "Please enter valid answer: 'y' or 'n'"
  end
  answer
end
system 'clear'
loop do
  player_score = 0
  computer_score = 0

  loop do
    board = initialize_board
    current_player = who_first
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    if detect_winner(board) == "Player"
      player_score += 1
    elsif detect_winner(board) == "Computer"
      computer_score += 1
    end

    break if player_score == 3 || computer_score == 3
    show_results(player_score, computer_score)
  end

  break unless exit_game? == 'y'
end

prompt "Tanks for playing Tic Tac Toe! Bye-Bye!"
