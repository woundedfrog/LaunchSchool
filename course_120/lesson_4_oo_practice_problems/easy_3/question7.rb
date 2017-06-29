#What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

#ANSWER:
#The biggest waste is the 'return' on line 12. Ruby returns the last line(expression) in a method, so the return here is unnecessary.
#The attr getter and setter methods are not used here either. They offer potential value, should we attempt to call or re-assign the brightness and color outside the class instance.
#The brightness and color instance variables are not used here. They add state, but in the code show above it does nothing with those variables.