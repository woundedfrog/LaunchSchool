require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  COMBOS = {
    'rock' => %w(scissors lizard),
    'paper' => %w(rock spock),
    'scissors' => %w(paper lizard),
    'lizard' => %w(spock paper),
    'spock' => %w(rock scissors)
    }
  WIN_COMBOS = {
    'rock' => %w(spock paper),
    'paper' => %w(lizard scissors),
    'scissors' => %w(rock spock),
    'lizard' => %w(rock scissors),
    'spock' => %w(paper lizard)
    }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    COMBOS[@value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class MoveHistory
  attr_accessor :move_options, :player_history, :current_game_history

  def initialize
    @player_history = {'rock' => 0, 'paper' => 0, 'scissors' => 0, 'lizard' => 0, 'spock' => 0}
    @current_game_history = {'rock' => 1, 'paper' => 1, 'scissors' => 1, 'lizard' => 1, 'spock' => 1}
    @move_options = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  end

  def update_history(move)
    @player_history[move] += 1
    @current_game_history[move] += 1
  end

  def update_win(move)
    new_history = []
    @current_game_history.each do |hand,weight|
      new_history << [hand] * weight
    end
    @move_options = new_history.flatten.sort
  end

  def new_history
    new_history = []
    @move_options << new_history  
  end

  def to_s
    self
  end
end

class Player
  attr_accessor :move, :name, :player_score, :pl_history

  def initialize
    set_name
    @pl_history = MoveHistory.new
    @player_score = 0
  end

  def increment_score
    @player_score += 1
  end
end

class Human < Player
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
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice!"
    end
    self.move = Move.new(choice)
    @pl_history.update_history(self.move.value)
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "Mr.Bigglesworth", "Timmy"].sample
  end

  def choose(move_options)
    best_move = move_options.sample
    self.move = Move.new(Move::WIN_COMBOS[best_move].sample)
    @pl_history.update_history(self.move.value)
  end
end

class GameMessages
  def display_welcome_message
    system 'clear'
    puts "Hello, #{human.name}! Welcome to Rock Paper Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock paper Scissors!"
  end

  def display_moves
    puts ""
    puts "+---#{human.name} chose #{human.move}.---+".center(80)
    puts "+---#{computer.name} chose #{computer.move}.---+".center(80)
    puts ""
  end

  def display_round_winner
    human.pl_history.update_win(human.move.value)

    if human.move > computer.move
      human.increment_score
      puts "#{human.name} won #{human.player_score}/#{@win_limit} games!".center(80)
      puts "#{computer.name} won #{computer.player_score}/#{@win_limit} rounds!".center(80)
    elsif computer.move > human.move
      computer.increment_score
      puts "#{human.name} won #{human.player_score}/#{@win_limit} games!".center(80)
      puts "#{computer.name} won #{computer.player_score}/#{@win_limit} rounds!".center(80)
    else
      puts "It's a tie!".center(80)
    end
    #puts "#{human.pl_history.current_game_history} : #{human.pl_history.move_options}" #used for testing only
  end

  def game_winner!
    if human.player_score > computer.player_score
      puts "You beat the computer. GREAT!".center(80)
    else
      puts "The computer won! LOSER!".center(80)
    end
    human.player_score = 0
    computer.player_score = 0
  end
end

class UserPrompts < GameMessages
  def play_again?
    answer = nil
    loop do
      puts "We've reached the end of the game. Would you like to play again? (y/n)".center(80)
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, input must be 'y' or 'n'"
    end
    system 'clear'
    answer.downcase == 'y' # this returns true or false automatically
  end

  def choose_win_limit
    puts "Please choose a winnings score - (1~10)."
    loop do
      @win_limit = gets.chomp.to_i
      break if @win_limit > 0
      puts "Please enter a valid number!"
    end
    system 'clear'
    puts "Thank you! Let's start."
  end
end

class RPSGame < UserPrompts
  attr_accessor :human, :computer

  def initialize
    system 'clear'
    @human = Human.new
    @computer = Computer.new
    @win_limit = 0
  end

  def play
    display_welcome_message
    choose_win_limit
    round_counter = 0

    loop do
      round_counter += 1
      puts "Round #{round_counter}"
      computer.choose(human.pl_history.move_options)
      human.choose
      display_moves
      display_round_winner
      if (human.player_score >= @win_limit || computer.player_score >= @win_limit)
        game_winner!
        break unless play_again?
        round_counter = 0
        choose_win_limit
      end    
    end
    display_goodbye_message
  end
end

RPSGame.new.play
#x = RPSGame.new
