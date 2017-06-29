#If we have this code:

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
#What happens in each of the following cases:

#case 1:

#hello =   Hello.new
#hello.hi  #=> Prints out "Hello" - returns Nil

#case 2:

#hello = Hello.new
#hello.bye    #=> (NoMethodError) - undefined method 'bye'. This is because there is no 'bye' method in the Hello class or Greeting class.
               # method lookup chains can only go upwards and in this example the Goodbye class is not connected with the Hello class.

#case 3:

#hello = Hello.new
#hello.greet    #=> (ArgumentError) expect 1, given 0 - Wrong number of arguments. The `greet` method requires an argument and here we are not providing one. 
# We are able to call this method, but since we don't pass in an argument, we receive an error.

#case 4:

#hello = Hello.new
#hello.greet("Goodbye") #=> unlike case3, here we are calling the same greet method, except now we are providing(passing in) an argument.
#this allows the puts method inside the greet method to print out the argument to the console.

#case 5:

#Hello.hi #=>  NoMethodError - undefined method "hi"

#Here we get a NoMethodError - we can only call class methods on the class itself. In this case the "hi" method is an instance method.
#-  It is only available for instances of the class.
# Since the 'hi' method is not a class method, we cannot call the hi method directly on the class.