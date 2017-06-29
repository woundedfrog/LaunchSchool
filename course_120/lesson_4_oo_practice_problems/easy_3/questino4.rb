#Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end
#How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

#ANSWER: to print out a custom message when 'to_s' is called on an instance we need to overwrite the to_s method inside the class.
#e.g.

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat?"
  end
end

#we test this:
puts Cat.new("Tabby")