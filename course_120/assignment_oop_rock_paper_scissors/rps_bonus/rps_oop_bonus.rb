class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == "scissors"
  end

  def rock?
    @value == "rock"
  end

  def paper?
    @value == "paper"
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :player_score

  def initialize
    set_name
    # when the player(computer or human class is called) object is instantiated.
    # this method is called as soon as the constructor method is initialized.
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
      n = gets.chomp # this 'n' is a local VAR.
      break unless n.empty?
      puts "Sorry, that's not a valid input!"
    end
    self.name = n.capitalize # A setter method needs to be invoked with a 'self.'
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
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Hal", "Mr.Bigglesworth", "Timmy"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    system 'clear'
    @human = Human.new
    @computer = Computer.new
    @win_limit = 0
  end

  def display_welcome_message
    system 'clear'
    puts "Hello, #{human.name}! Welcome to Rock Paper Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock paper Scissors!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      human.increment_score
      puts "#{human.name} won #{human.player_score}/#{@win_limit} games!".center(80)
      puts "#{computer.name} won #{computer.player_score}/#{@win_limit} rounds!".center(80)
    elsif human.move < computer.move
      computer.increment_score
      puts "#{human.name} won #{human.player_score}/#{@win_limit} games!".center(80)
      puts "#{computer.name} won #{computer.player_score}/#{@win_limit} rounds!".center(80)
    else
      puts "It's a tie!".center(80)
    end
  end
  
  def game_winner!
    if human.player_score > computer.player_score
      puts "You beat the computer. GREAT!"
    else
      puts "The computer won! LOSER!"
    end
    human.player_score = 0
    computer.player_score = 0
  end
  
  def play_again?
    answer = nil
    loop do
      puts "We've reached the end of the game. Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, input must be 'y' or 'n'"
    end

    answer.downcase == 'y' # this returns true or false automatically
  end

  def game_win_limit?
    puts "Please choose the number of wins necessary to win - (1~10)."
    loop do
      @win_limit = gets.chomp.to_i
      break if @win_limit > 0
      puts "Please enter a valid number!"
    end
    system 'clear'
    puts "Thank you! Let's start."
  end

  def play
    display_welcome_message
    game_win_limit?
    round_counter = 0

    loop do
      round_counter += 1
      puts "Round #{round_counter}"
      human.choose # class instance method "choose".
      computer.choose
      display_moves
      display_round_winner
      if (human.player_score >= @win_limit || computer.player_score >= @win_limit)  #checks if a player reached necessary wins
        game_winner! #prints out winner message
        break unless play_again?  #breaks if answer is no
        round_counter = 0 #reset round counter
      end    
    end
    display_goodbye_message
  end
end

RPSGame.new.play
