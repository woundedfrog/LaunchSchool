class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"


#The above code throws and error because we are attempting to reassign a new name to the 'bob' object, but the attr_reader only allows us to read the instance variable, but NOT reassign it. => we have a reader method, but not a setter method.

#we can fix this by changing the code on line '2' to 'attr_write' or 'attr_accessor'.

class Person
  #  attr_reader :name
  attr_write :name   #OR attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"