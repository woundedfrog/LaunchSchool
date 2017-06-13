#Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
  
end

Cat.generic_greeting

#Further Exploration

#What happens if you run kitty.class.generic_greeting? Can you explain this result?

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
kitty.generic_greeting 
#we are invoking the generic_greeting method on an  object that's an instance of the class.
#So it looks for an instance method, which it does not find.
#This is because the generic_greeting is a class method, not an instance method.