#If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
#Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

#@@cats_count is a class variable. This means it is not specific to an instance of the class - e.g. two objects of this class have access to the same variable, not instances of it. If one object were to modify it, then the other class would see the effect.

#In this situation, the @@cats_count is initialized and Incremented by 1 when an object of the class is instantiated. 
# the purpose here is to keep track of the number of Cat objects that are instanciated - e.g. objects created.
# we know this because the incrementer is inside teh initialize method. Meaning it will increment by 1 every time a new object is instantiated.
