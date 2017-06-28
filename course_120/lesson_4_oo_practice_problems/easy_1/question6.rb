#What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

#ANSWER:
#We could add an attr_accessor or attr_reader method to the class. In both cases we would have access to the instance variable's value.
#e.g.
class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end

a_cube = Cube.new(1000)
a_cube.volume

#OR by creating a method to return that value:
class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def get_volume
    @volume
  end
end

#Finally: There we could call the `instance_variable_get()` which takes one argument surrounded by QUOTE marks, on the object.
big_cube = Cube.new(1000)
big_cube.instance_variable_get("@volume")
#=> 1000