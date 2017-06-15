#Refactoring the RPS OOP game

#Compare this design with the one in the previous assignment:
#
#1)Is this design, with Human and Computer sub-classes, better? Why, or why not?
#Yes, it is better, because it makes reading the code easier. Since each player is now set to it's own class, it' follows a better hierarchy.
#2)what is the primary improvement of this new design?
#I think the primary improvements of this design are:
  #a) A better hierarchy and properly creating classes for the main areas of our game.
  #b) It is much easier to follow and read the code.
#3)what is the primary drawback of this new design?
  #None that I can see, in my limited knowledge

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
      break if  ['rock','paper','scissors'].include?(choice)
      puts "Sorry, invalid choice!"
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2","Hal", "Mr.Bigglesworth", "Timmy"].sample
  end

  def choose
    self.move = ['rock','paper','scissors'].sample
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
      human.choose  #class instance method "choose". human is refering to the getter method, which refrences the instance method 'human'. It's value is an object of the Human class.
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
