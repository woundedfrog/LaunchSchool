#If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

#ANSWER:
#We need to call `.new` on the class name. We also need to pass in two arguments when we instantiates the instance.
#This is because the initialize method inside the class requires two arguments - a color and material value.
#e.g.
Bag.new('blue','plastic')

#if we don't include the two arguments, then we'd receive the following error:

#ArgumentError: wrong number of arguments (0 for 2)
#  from (irb):in `initialize'
#  from (irb):in `new'