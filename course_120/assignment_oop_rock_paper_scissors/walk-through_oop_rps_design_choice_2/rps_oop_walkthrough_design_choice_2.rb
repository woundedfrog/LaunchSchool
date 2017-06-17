#Compare this design with the one in the previous assignment:
#
#1)what is the primary improvement of this new design?
#There is a slight improvement regarding code redundancy.
#It's a lot more dry
##the Greater/ Less than methods in the MOVE class are not dry as could be.
#2)what is the primary drawback of this new design?
##Creating too many classes can create too many dependencies.

class Move
  VALUES = ['rock','paper','scissors']

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
    if rock?
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end

  def <(other_move)
    if rock?
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
  end

  def to_s
    @value
  end
end


class Player
  attr_accessor :move, :name

  def initialize
    set_name  #when the player(computer or human class is called) object is instantiated, this method is called as soon as the constructor method is initialized.
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp  #this 'n' is a local VAR. A setter method needs to be invoked with a 'self.'
      break unless n.empty?
      puts "Sorry, that's not a valid input!"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors:"
      choice = gets.chomp.downcase
      break if  Move::VALUES.include?(choice)
      puts "Sorry, invalid choice!"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2","Hal", "Mr.Bigglesworth", "Timmy"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new 
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

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move  #simplier way is to reverse this and use the already GREATER THAN method. e.g. computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
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
      human.choose  #class instance method "choose". human is refering to the getter method, which refrences the instance method 'human'. It's value is an object of the Human class.
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
