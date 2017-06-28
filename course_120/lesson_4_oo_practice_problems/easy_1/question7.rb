#What is the default thing that Ruby will print to the screen if you call to_s on an object? Where could you go to find out if you want to be sure?

#ANSWER:
#1)The default message that will be printed is the object's class and its object_id.
#2) You could verify this by refering to the Ruby documentation: http://ruby-doc.org/core-2.2.0/Object.html#method-i-to_s
#e.g.
class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def get_volume
    @volume
  end
end

big_cube = Cube.new(1000)
big_cube.to_s
#=> "#<Cube:0x00000001b38890>"