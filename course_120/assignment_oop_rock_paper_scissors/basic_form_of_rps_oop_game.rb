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

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human_choose_move
    computer_choose_move
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play