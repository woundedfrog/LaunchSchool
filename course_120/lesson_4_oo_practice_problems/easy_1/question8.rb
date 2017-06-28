#If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
#You can see in the make_one_year_older method we have used self. What does self refer to here?

#ANSWER:
#`make_one_year_older` is an instance method and thus can only be called on instances of that class(Cat).
#`self` is referencing the instance object that called called it - the calling object.
    
#Example:
snuggles = Cat.new("Tabby")
p snuggles.make_one_year_older

#self is referencing the instance(snuggle object) of the Cat class.