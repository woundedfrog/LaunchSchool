#What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

#class BeesWax
#  def initialize(type)
#    @type = type
#  end
#
#  def type
#    @type
#  end
#
#  def type=(t)
#    @type = t
#  end
#
#  def describe_type
#    puts "I am a #{@type} of Bees Wax"
#  end
#end

#answer:
class BeesWax
  attr_accessor :type
  
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

#We simplify it by removing the two type methods and replacing it with a single `attr` method. 
# attr_accessor gives up both read and write access on the @type instance variable.
#Because we now have an getter method, we can remove the @ symbol from our @type instance variable. *Only in places outside of the initialize(constructor) method.
