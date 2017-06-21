require 'pry'

class Move
  VALUES = ["rock", "paper", "scissors", "spock", "lizard"]

  WIN_COMBOS = {
    'rock' => %w[spock paper],
    'paper' => %w[lizard scissors],
    'scissors' => %w[rock spock],
    'lizard' => %w[rock scissors],
    'spock' => %w[paper lizard]
  }
  attr_reader :value

  def initialize; end

  def to_s
    @value.to_s
  end
end

class Rock < Move
  def initialize; @value = "rock"; end

  def >(other_move)
    ["scissors", "lizard"].include?(other_move.value)
  end
end

class Paper < Move
  def initialize; @value = "paper"; end

  def >(other_move)
    ["rock", "spock"].include?(other_move.value)
  end
end

class Scissors < Move
  def initialize; @value = "scissors"; end

  def >(other_move)
    ["lizard", "paper"].include?(other_move.value)
  end
end

class Lizard < Move
  def initialize; @value = "lizard"; end

  def >(other_move)
    ["paper", "spock"].include?(other_move.value)
  end
end

class Spock < Move
  def initialize; @value = "spock"; end

  def >(other_move)
    ["rock", "scissors"].include?(other_move.value)
  end
end

module MoveHistory
  def update_history(move, result)
    @player_history << [move, result]
    @current_game_history[move] += 1
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
          [hand] * 1
        end
    end
    (@move_options << new_hist).flatten!.sort!
  end

  def new_history
    @player_history = []
    @current_game_history = {
      'rock' => 0,
      'paper' => 0,
      'scissors' => 0,
      'lizard' => 0,
      'spock' => 0
    }
    @move_options = ["rock", "paper", "scissors", "spock", "lizard"]
  end
end

class Player
  include MoveHistory
  attr_accessor :move, :name, :bot, :player_score,
                :player_history, :current_game_history, :move_options

  def initialize
    @player_history = []
    @move_options = nil
    @current_game_history = nil
    @player_score = 0
    new_history
  end

  def increment_score
    @player_score += 1
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

  def set_name
    n = nil
    loop do
      puts "Please enter your player name!"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, that's not a valid input!"
    end
    self.name = n.capitalize
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
    self.move = instantiate_move(choice)
  end

  def choice_define(choice)
    case choice
    when 1 then 'rock'
    when 2 then 'paper'
    when 3 then 'scissors'
    when 4 then 'lizard'
    when 5 then 'spock'
    end
  end
end

class Computer < Player
  def initialize
    @bot = choose_difficulty
    super
  end

  def choose_difficulty
    puts "Please choose a difficulty:"
    puts " (1) Easy - AI => Eddy"
    puts " (2) Medium - AI => Mr. Bigglesworth"
    puts " (3) Difficult - AI => R2D2"
    puts " (4) Random - AI => Random"
    answer = gets.chomp.to_i
    difficult(answer)
  end

  def difficult(answer)
    case answer
    when 1 then Easy.new
    when 2 then Medium.new
    when 3 then Difficult.new
    when 4 then [Difficult.new, Medium.new, Easy.new].sample
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

  def choose(move_options)
    selection = move_options.sample
    move = Move::WIN_COMBOS[selection].sample
    self.move = instantiate_move(move)
  end
end

class Difficult < Computer
  def initialize
    @name = "R2D2"
  end

  def choose(move_options)
    selection = move_options.sample
    move = Move::WIN_COMBOS[selection].sample
    self.move = instantiate_move(move)
  end
end

module GameMessages
  CONSOLE_WIDTH = 80

  def format_message(*message)
    system 'clear'
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
    puts "Thank you for playing Rock paper Scissors Lizard and Spock!"
  end

  def display_moves
    line1 = "+----#{human.name} || #{computer.bot.name}----+"
    line2 = "It's a tie!"
    line2 = "#{human.name} won!" if human.move > computer.bot.move
    line2 = "#{computer.bot.name} won!" if computer.bot.move > human.move
    format_message(line1, line2)
  end

  def display_round_winner
    if human.move > computer.bot.move
      human_winner
    elsif computer.bot.move > human.move
      computer_winner
    else
      computer.update_history(computer.bot.move.value, ' ')
      human.update_history(human.move.value, ' ')
    end
    human.update_win(human.move.value, computer.name)
    print_score_message
  end

  def print_score_message
    puts ""
    puts move_list
    puts_center("#{human.name} won #{human.player_score}/#{@win_limit} games!")
    puts_center("#{computer.bot.name} won #{computer.player_score}/#{@win_limit} games!")
    puts_center("______________________")
    puts ""
  end

  def human_winner
    human.increment_score
    human.update_history(human.move.value, 'x')
    computer.update_history(computer.bot.move.value, ' ')
  end

  def computer_winner
    computer.increment_score
    computer.update_history(computer.bot.move.value, 'x')
    human.update_history(human.move.value, ' ')
  end

  def move_list
    human.player_history.size.times do |x|
      human_info = "#{human.player_history[x][0]} #{human.player_history[x][1]}"
      comp_info = "#{computer.player_history[x][1]} #{computer.player_history[x][0]}"
      puts " " * (38 - human_info.size) + "#{human_info} || #{comp_info}"
    end
    print ""
  end

  def game_winner!
    if human.player_score > computer.player_score
      format_message("You beat the computer. GREAT!")
    else
      format_message("The computer won! TERRIBLE!")
    end
  end
end

module UserPrompts
  def play_again?
    answer = nil
    loop do
      puts_center("Game Over. Would you like to play again? (y/n)")
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, input must be 'y' or 'n'"
    end
    system 'clear'
    answer.downcase == 'y'
  end

  def choose_win_limit
    puts "Please choose a winnings score - 1 - 10."
    loop do
      @win_limit = gets.chomp.to_i
      break if @win_limit > 0
      puts "Please enter a valid number!"
    end
    system 'clear'
    puts "Thank you! Let's start."
  end
end

class NewGame
  def initialize_new_game
    @computer = Computer.new
    choose_win_limit
    human.new_history
    computer.new_history
    human.player_score = 0
    computer.player_score = 0
    @round_counter = 0
  end
end

class RPSGame < NewGame
  attr_accessor :human, :computer
  include UserPrompts
  include GameMessages

  def initialize
    system 'clear'
    display_welcome_message
    @win_limit = 0
    @human = Human.new
  end

  def play
    initialize_new_game
    loop do
      @round_counter += 1
      puts "Round #{@round_counter}"
      computer.bot.choose(human.move_options)
      human.choose
      display_moves
      display_round_winner
      if human.player_score >= @win_limit || computer.player_score >= @win_limit
        game_winner!
        break unless play_again?
        initialize_new_game
      end
    end
    display_goodbye_message
  end
end

RPSGame.new.play
