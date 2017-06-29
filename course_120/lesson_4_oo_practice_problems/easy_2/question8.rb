#If we have this class:

class Game
  def play
    "Start the game!"
  end
end
#And another class:

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
#What can we add to the Bingo class to allow it to inherit the play method from the Game class?

#ANSWER
# We can allow the Bingo class to inherit from the Game class by using the "<" symbol. followed by the class name we wish to inherit from.
#e.g.

#class Bingo < Game
#  
#end
#We can test it by running the following code.
game_of_bingo = Bingo.new
#=> #<Bingo:0x007f9d19b537c8>
game_of_bingo.play
#=> "Start the game!"