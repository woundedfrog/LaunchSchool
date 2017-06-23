# verion 2
class Move
  VALUES = ["rock", "paper", "scissors", "spock", "lizard"]

  WIN_COMBOS = {
    'rock' => %w[spock paper],
    'paper' => %w[lizard scissors],
    'scissors' => %w[rock spock],
    'lizard' => %w[rock scissors],
    'spock' => %w[paper lizard]
  }

  COMPARE_HANDS = {
    'rock' => %w[scissors lizard],
    'paper' => %w[rock spock],
    'scissors' => %w[paper lizard],
    'lizard' => %w[spock paper],
    'spock' => %w[rock scissors]
  }

  attr_reader :value

  def to_s
    @value.to_s
  end

  def >(other_move)
    COMPARE_HANDS[value].include?(other_move)
  end
end

class Rock < Move
  def initialize
    @value = "rock"
  end
end

class Paper < Move
  def initialize
    @value = "paper"
  end
end

class Scissors < Move
  def initialize
    @value = "scissors"
  end
end

class Lizard < Move
  def initialize
    @value = "lizard"
  end
end

class Spock < Move
  def initialize
    @value = "spock"
  end
end

module MoveHistory
  def update_history(move, result)
    @player_hist << [move, result]
    @current_game_history[move] += 1
    increment_score unless result.include?(" ")
  end

  def update_win(move, comp_n)
    new_hist = []
    @current_game_history.each do |hand, _|
      new_hist <<
        if move == hand && comp_n == "Mr. Bigglesworth"
          [hand] * 3
        elsif move == hand
          [hand] * 4
        else
          [hand] * 0
        end
    end

    (@move_options << new_hist).flatten!.sort!
    move_options_resize(move, comp_n) if @move_options.size > 40
  end

  def move_options_resize(move, comp_n)
    Move::WIN_COMBOS[move].each do |val|
      @move_options.delete(val)
      @move_options << val if comp_n == "Mr. Bigglesworth"
    end
  end

  def increment_score
    @player_score += 1
  end

  def reset_history
    @player_hist = []
    @move_options = ["rock", "paper", "scissors", "spock", "lizard"]
    @current_game_history = {
      'rock' => 0, 'paper' => 0, 'scissors' => 0,
      'lizard' => 0, 'spock' => 0
    }
  end
end

class Player
  include MoveHistory
  attr_accessor :move, :player_score
  attr_reader :bot, :player_hist, :move_options, :name

  def initialize
    @player_hist = []
    @move_options = nil
    @current_game_history = nil
    @player_score = 0
    reset_history
  end

  def instantiate_move(choice)
    case choice
    when "rock" then Rock.new
    when "paper" then Paper.new
    when "scissors" then Scissors.new
    when "lizard" then Lizard.new
    when "spock" then Spock.new
    end
  end
end

class Human < Player
  def initialize
    super
    set_name
  end

  def move
    @move.value
  end

  def choose
    choice = nil
    loop do
      puts "Choose a move (1)rock, (2)paper, (3)scissors, (4)lizard, (5)spock:"
      choice = gets.chomp.to_i
      break if [1, 2, 3, 4, 5].include?(choice)
      puts "Sorry, invalid choice number!"
    end

    choice = choice_define(choice)
    @move = instantiate_move(choice)
  end

  private

  def choice_define(choice)
    case choice
    when 1 then 'rock'
    when 2 then 'paper'
    when 3 then 'scissors'
    when 4 then 'lizard'
    when 5 then 'spock'
    end
  end

  def set_name
    n = nil
    loop do
      puts "Please enter your player name!"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, that's not a valid input!"
    end
    @name = n.capitalize
  end
end

class Computer < Player
  def initialize
    @bot = choose_difficulty
    super
  end

  def b_name
    @bot.name
  end

  def b_move
    @bot.move.value
  end

  def b_choose(move_options)
    @bot.choose(move_options)
  end

  def choose(move_options)
    selection = move_options.sample
    move = Move::WIN_COMBOS[selection].sample
    @move = instantiate_move(move)
  end

  private

  def choose_difficulty
    loop do
      puts "Please choose a difficulty:"
      puts " (1) Easy - AI => Eddy"
      puts " (2) Medium - AI => Mr. Bigglesworth"
      puts " (3) Hard - AI => R2D2"
      puts " (4) Random - AI => Random"
      answer = gets.chomp.to_i
      return difficulty(answer) if [1, 2, 3, 4].include?(answer)
      puts "Invalid input!"
    end
  end

  def difficulty(answer)
    case answer
    when 1 then Easy.new
    when 2 then Medium.new
    when 3 then Hard.new
    when 4 then [Hard.new, Medium.new, Easy.new].sample
    end
  end
end

class Easy < Computer
  def initialize
    @name = "Eddy"
  end

  def choose(*)
    self.move = instantiate_move(Move::VALUES.sample)
  end
end

class Medium < Computer
  def initialize
    @name = "Mr. Bigglesworth"
  end
end

class Hard < Computer
  def initialize
    @name = "R2D2"
  end
end

module ScoreKeeper
  def determine_winner_update_history
    human_move = human.move
    computer_move = computer.b_move
    if human_move > computer_move
      human_update_score_and_history
    elsif computer_move > human_move
      computer_update_score_and_history
    else
      computer.update_history(computer_move, ' ')
      human.update_history(human_move, ' ')
    end
    human.update_win(human_move, computer.b_name)
  end

  def human_update_score_and_history
    human.update_history(human.move, 'x')
    computer.update_history(computer.b_move, ' ')
  end

  def computer_update_score_and_history
    computer.update_history(computer.b_move, 'x')
    human.update_history(human.move, ' ')
  end
end

module GameMessages
  private

  include ScoreKeeper

  CONSOLE_WIDTH = 80

  def format_message(*message)
    (system 'clear') || (system 'cls')
    puts "=" * CONSOLE_WIDTH
    message.each do |line|
      puts_center(line)
    end
    puts "=" * CONSOLE_WIDTH
  end

  def puts_center(message)
    puts message.center(CONSOLE_WIDTH)
  end

  def display_welcome_message
    line1 = "Hello! Welcome to Rock Paper Scissors Lizard and Spock!"
    format_message(line1)
  end

  def display_goodbye_message
    format_message("Thank you for playing!")
    puts "\n\n\n\n"
  end

  def display_moves
    human_name = human.name
    computer_name = computer.b_name
    human_move = human.move
    computer_move = computer.b_move
    line1 = "+----#{human_name} || #{computer_name}----+"
    line2 = "It's a tie!"
    line2 = "#{human_name} won!" if human_move > computer_move
    line2 = "#{computer_name} won!" if computer_move > human_move
    format_message(line1, line2)
  end

  def display_round_win_info
    comp_score = computer.player_score
    human_score = human.player_score
    puts_center("Round #{@round_counter}")
    display_move_list(comp_score, human_score)
  end

  def display_move_list(comp_score, human_score)
    human.player_hist.size.times do |x|
      display_score_board(x)
    end
    print ""
    puts_center("______________________\n")
    puts_center("#{human.name} won #{human_score}/#{@win_limit} rounds!")
    puts_center("#{computer.b_name} won #{comp_score}/#{@win_limit} rounds!")
    puts "=" * CONSOLE_WIDTH + "\n"
  end

  def display_score_board(x)
    human_info = human.player_hist[x].join(' ')
    comp_info = computer.player_hist[x].reverse.join(' ')
    puts " " * (38 - human_info.size) + "#{human_info} || #{comp_info}"
  end

  def display_game_winner_message
    if human.player_score > computer.player_score
      format_message("You beat the computer. GREAT!")
    else
      format_message("The computer won! TERRIBLE!")
    end
    display_round_win_info
  end
end

module UserPrompts
  private

  def play_again?
    answer = nil
    loop do
      puts_center("Game Over. Would you like to play again? (y/n)")
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, input must be 'y' or 'n'"
    end
    (system 'clear') || (system 'cls')
    answer.downcase == 'y'
  end

  def choose_win_limit
    puts "Please choose a winnings score - 1 - 10."
    loop do
      @win_limit = gets.chomp.to_i
      break if @win_limit > 0
      puts "Please enter a valid number!"
    end
    (system 'clear') || (system 'cls')
    puts "Thank you! Let's start."
  end
end

class RPSGame
  attr_accessor :human, :computer
  include UserPrompts
  include GameMessages

  def initialize
    (system 'clear') || (system 'cls')
    display_welcome_message
    @win_limit = 0
    @human = Human.new
  end

  def play
    initialize_new_game
    loop do
      @round_counter += 1
      computer.b_choose(human.move_options)
      human.choose
      display_moves
      determine_winner_update_history
      display_round_win_info
      if game_over?
        display_game_winner_message
        break unless play_again?
        initialize_new_game
      end
    end
    display_goodbye_message
  end

  private

  def game_over?
    human.player_score >= @win_limit || computer.player_score >= @win_limit
  end

  def initialize_new_game
    @computer = Computer.new
    choose_win_limit
    human.reset_history
    computer.reset_history
    human.player_score = 0
    computer.player_score = 0
    @round_counter = 0
  end
end

RPSGame.new.play
