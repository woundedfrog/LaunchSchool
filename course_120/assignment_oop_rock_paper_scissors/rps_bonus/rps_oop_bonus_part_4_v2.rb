require 'pry'

class Move
  VALUES = ["rock", "paper", "scissors", "spock", "lizard"]
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

#class Move
#  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
#
#  COMBOS = {
#    'rock' => %w(scissors lizard),
#    'paper' => %w(rock spock),
#    'scissors' => %w(paper lizard),
#    'lizard' => %w(spock paper),
#    'spock' => %w(rock scissors)
#    }
#  WIN_COMBOS = {
#    'rock' => %w(spock paper),
#    'paper' => %w(lizard scissors),
#    'scissors' => %w(rock spock),
#    'lizard' => %w(rock scissors),
#    'spock' => %w(paper lizard)
#    }
#
#  attr_reader :value
#
#  def initialize(value)
#    @value = value
#  end
#
#  def >(other_move)
#    COMBOS[@value].include?(other_move.value)
#  end

#  def to_s
#    @value
#  end
#end

class MoveHistory
  attr_accessor :move_options, :player_history, :current_game_history

  def initialize
    @player_history = []
    @current_game_history = {'rock' => 0, 'paper' => 0, 'scissors' => 0, 'lizard' => 0, 'spock' => 0}
    @move_options = ['rock','rock','paper','paper', 'scissors','scissors', 'lizard', 'lizard', 'spock', 'spock']
  end

  def update_history(move, result)
    @player_history << [move, result]
    #@current_game_history[move] += 1
  end

  def update_win(move)
    new_history = []
    @current_game_history.each do |hand,weight|
      new_history << [move] * (weight + 3)
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
  attr_accessor :move, :name, :bot, :player_score, :pl_history

  def initialize
    @pl_history = MoveHistory.new
    @player_score = 0
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
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice!"
    end
    self.move = instantiate_move(choice)
  end
  
  def to_s
    @move
  end
end

class Computer < Player
  
  def initialize
   @bot = choose_difficulty
    super
  end
  
  #def set_name
  #  self.name = choose_difficulty
  #end

  #def choose(move_options)
  #  self.move = instantiate_move(move_options.sample)
  #  #@pl_history.update_history(self.move.value)
  #end  
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
      when 4 then [Random.new, Difficult.new, Medium.new, Easy.new].sample
      end
  end
end

class Easy < Computer
  def initialize
    @name = "Eddy"
    @move = choose
  end
  
  def choose
    self.move = instantiate_move(Move::VALUES.sample)
  end
end

class Medium < Computer
   def initialize
    @name = "Mr. Bigglesworth"
  end
end

class Difficult < Computer
  def initialize
    @name = "R2D2"
  end
end

class GameMessages
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
    line1 = "Hello! Welcome to Rock Paper Scissors!"
    format_message(line1)
  end

  def display_goodbye_message
    puts "Thank you for playing Rock paper Scissors!"
  end

  def display_moves
    line1 = "+---#{human.name} chose #{human.move}.---+ | +---#{computer.bot.name} chose #{computer.bot.move}.---+"
    if human.move > computer.bot.move 
      line2 = "#{human.name} won!"
    elsif computer.bot.move > human.move 
      line2 ="#{computer.bot.name} won!"
    else
      line2 = "It's a tie!"
    end
      format_message(line1,line2)
  end

  def display_round_winner
    if human.move > computer.bot.move
      human.increment_score
      human.pl_history.update_history(human.move.value, 'x')
      computer.pl_history.update_history(computer.bot.move.value, '')
    elsif computer.bot.move > human.move
      computer.increment_score
      computer.pl_history.update_history(computer.bot.move.value, 'x')
      human.pl_history.update_history(human.move.value, '')
    else
      computer.pl_history.update_history(computer.bot.move.value, '')
      human.pl_history.update_history(human.move.value, '')
    end
      puts ""
      puts move_list
      puts_center("#{human.name} won #{human.player_score}/#{@win_limit} games!")
      puts_center("#{computer.bot.name} won #{computer.player_score}/#{@win_limit} rounds!")
      puts_center("______________________")
      puts ""
  end
    
  def move_list
    human.pl_history.player_history.size.times do |x|
      puts "#{human.pl_history.player_history[x][1]} #{human.pl_history.player_history[x][0]} || #{computer.pl_history.player_history[x][0]} #{computer.pl_history.player_history[x][1]}".ljust(80)
  end
    puts ""
    #puts_center("#{*human.pl_history.player_history} | #{computer.pl_history.player_history}")
  end

  def game_winner!
    if human.player_score > computer.player_score
      format_message("You beat the computer. GREAT!")
    else
      format_message("The computer won! LOSER!")
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

class RPSGame < UserPrompts
  attr_accessor :human, :computer

  def initialize
    system 'clear'
    display_welcome_message
    @win_limit = 0
  end

  def play
    @human = Human.new
    @computer = Computer.new
    choose_win_limit
    round_counter = 0

    loop do
      round_counter += 1
      puts "Round #{round_counter}"
      

      computer.bot.choose
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
