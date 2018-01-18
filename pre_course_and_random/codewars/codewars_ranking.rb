#Write a class called User that is used to calculate the amount that a user will progress through a ranking system similar to the one Codewars uses.
#
#Business Rules:
#
#A user starts at rank -8 and can progress all the way to 8.
#There is no 0 (zero) rank. The next rank after -1 is 1.
#Users will complete activities. These activities also have ranks.
#Each time the user completes a ranked activity the users rank progress is updated based off of the activity's rank
#The progress earned from the completed activity is relative to what the user's current rank is compared to the rank of the activity
#A user's rank progress starts off at zero, each time the progress reaches 100 the user's rank is upgraded to the next level
#Any remaining progress earned while in the previous rank will be applied towards the next rank's progress (we don't throw any progress away). The exception is if there is no other rank left to progress towards (Once you reach rank 8 there is no more progression).
#A user cannot progress beyond rank 8.
#The only acceptable range of rank values is -8,-7,-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8. Any other value should raise an error.
#The progress is scored like so:
#
#Completing an activity that is ranked the same as that of the user's will be worth 3 points
#Completing an activity that is ranked one ranking lower than the user's will be worth 1 point
#Any activities completed that are ranking 2 levels or more lower than the user's ranking will be ignored
#Completing an activity ranked higher than the current user's rank will accelerate the rank progression. The greater the difference between rankings the more the progression will be increased. The formula is 10 * d * d where d equals the difference in ranking between the activity and the user.
#Logic Examples:
#
#If a user ranked -8 completes an activity ranked -7 they will receive 10 progress
#If a user ranked -8 completes an activity ranked -6 they will receive 40 progress
#If a user ranked -8 completes an activity ranked -5 they will receive 90 progress
#If a user ranked -8 completes an activity ranked -4 they will receive 160 progress, resulting in the user being upgraded to rank -7 and having earned 60 progress towards their next rank
#If a user ranked -1 completes an activity ranked 1 they will receive 10 progress (remember, zero rank is ignored)
#Code Usage Examples:
#
#user = User.new
#user.rank # => -8
#user.progress # => 0
#user.inc_progress(-7)
#user.progress # => 10
#user.inc_progress(-5) # will add 90 progress
#user.progress # => 0 # progress is now zero
#user.rank # => -7 # rank was upgraded to -7
#  
class User
  RANKS = (-8..-1).to_a + (1..8).to_a
  LEVEL = 100

  attr_reader :rank, :progress

  def initialize
    @rank = -8
    @progress = 0
  end

  def inc_progress(activity_level)
    raise ArgumentError.new('Wrong activity level.') if RANKS.include?(activity_level) == false

    difference = []
    if @rank == activity_level
      points = 3
      return level_up(points)
    elsif activity_level > @rank
      difference = (rank...activity_level).to_a
    else
      difference = (activity_level...rank).to_a
    end

    difference.delete(0)
    difference = difference.size
    if activit_level > @rank
      points = (10 * difference) * difference
    else
      points = 0 if difference >= 2
      points = 0 if difference >= 2
      points = 1 if difference == 1
    end
    level_up(points)
  end

  def level_up(points)
    @rank == 8 ? @progress = 0 : @progress += points
    confirm_rank
    @rank == 8 ? @progress = 0 : @progress %= LEVEL
  end

  def confirm_rank
    @rank += @progress / LEVEL
    if @rank == 0
      @rank += 1
    end
  end
end

user = User.new


require 'minitest/autorun'

class TestTry < Minitest::Test
  def test_progress
    x = User.new
    x.rank = 8
    x.progress = 1

    p  x.inc_progress(8)
    p assert_equal(0, x.progress)
  end
  def test_progress2
    x = User.new
    x.rank = 7
    x.progress = 91

    p  x.inc_progress(8)
    p assert_equal(1, x.progress)
  end
end