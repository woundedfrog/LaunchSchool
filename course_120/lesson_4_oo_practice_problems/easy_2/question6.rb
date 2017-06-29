#If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
#Which one of these is a class method (if any) and how do you know? How would you call a class method?


#ANSWER:
# self.manufacturer is a class method. If the name of a method is prefixed with the reserved word "self" then it's a class method.
# We can call a class method directly on the class. e.g.
Television.manufacturer

#we cannot class instance methods on the class itself because they are only available to instances of the class.
#Television.model #=> undefined method 'model' - NoMethodError
#Instance methods are all methods without the prefix 'self.' in the name.