#Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

#We need a new class Noble that shows the title and name when walk is called:
#INCLUDING FUTHER EXPLORATION:
module Walkable
  def walk
  "#{self} #{gait} forward"
  end
  
  def to_s
    name
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title
  def initialize(name, title)
    super(name)
    @title = title
  end
  
  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

class Animal
  attr_reader :name

  include Walkable
  
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal
  private

  def gait
    "runs"
  end
end
  
byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
#We must have access to both name and title because they are needed for other purposes that we aren't showing here.

byron.name
#=> "Byron"
byron.title
#=> "Lord"

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk