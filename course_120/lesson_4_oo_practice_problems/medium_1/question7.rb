#How could you change the method name below so that the method name is more clear and less repetitive.

#class Light
#  attr_accessor :brightness, :color
#
#  def initialize(brightness, color)
#    @brightness = brightness
#    @color = color
#  end
#
#  def self.light_information
#    "I want to turn on the light with a brightness level of super high and a colour of green"
#  end
#
#end

#ANSWER:
# when we invoce the light_information method, there is some redundancy is how it is read.
# e.g.
# Light.light_information

# 'light' is shown twice so it's easy to refactor the name to read 'Light.information'. Although both work fine and make sense, the second example is just better for readability.


class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end