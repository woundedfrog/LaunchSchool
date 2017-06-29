#If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
#What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

#ANSWER:
# If we instantiate a new object of the Bingo class, and then call "play" on that object, then the PLAY method from the Game class would be executed.
#However, if we were to add a play method to our Bingo class and call that method, then the PLAY method in the Game class would not get executed.
#This is because the method lookup chain searches in the Bingo class first, if the method is not found then the class is searched until found.

#It's a first come first serve situation.