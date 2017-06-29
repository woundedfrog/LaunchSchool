#In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#If we call Hello.hi we get an error message. How would you fix this?

#ANSWER:
#We can fix this code by changing the hi method to a class method e.g. prefixing the method name with 'self.'
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi
#On line 32 we prefix 'self' to make it a class method.
#inside the hi method we can't simply call the 'greet' method. This is because the greet method is still an instance method and only available to instances of the Hello class.
#To avoid another NoMethodError, we instantiate a new object and assign it to the variable "greeting". 
 #Because we now have an instance of the Greeting Class(which include the greet instance method) we are able to call "greet" on that object(Line34).