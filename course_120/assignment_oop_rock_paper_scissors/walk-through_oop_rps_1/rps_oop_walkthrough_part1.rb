#Here is the basic form/outline we have so far of the RPS game.
#There is a lot of unknowns at this point, such as the need for 'rule' and 'move' classes.


class Player
  def initialize
    # maybe a "name"? what about a "move"?
  end

  def choose

  end
end

class Move
  def initialize
    # seems like we need something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)

end

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)  #we have a default value set to human incase nothing is passed in.
    @player_type = player_type
    @move = nil
    set_name  #when the player object is instantiated, this method is called.
  end

  def set_name
    if human?
      n = nil
      loop do
        puts "What's your name?"
        n = gets.chomp  #this 'n' is a local VAR. A setter method needs to be invoked with a 'self.'
        break unless n.empty?
        puts "Sorry, that's not a valid input!"
      end
      self.name = n
    else
      self.name = ["R2D2","Hal", "Mr.Bigglesworth", "Timmy"].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, scissors:"
        choice = gets.chomp.downcase
        break if  ['rock','paper','scissors'].include?(choice)
        puts "Sorry, invalid choice!"
      end
      self.move = choice
    else
      self.move = ['rock','paper','scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)  #When instantiating a new object(which is assigned to the instance variable) we pass in the computer as an argument to the player class.
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock paper Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper' 
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y','n'].include?(answer.downcase)
      puts "Sorry, input must be 'y' or 'n'"
    end

    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play