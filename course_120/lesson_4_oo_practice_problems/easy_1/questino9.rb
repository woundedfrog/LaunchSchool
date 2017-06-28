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
#In the name of the cats_count method we have used self. What does self refer to in this context?

#ANSWER:
# A method whose name starts with `self.` is a class method. So the self here references the class itself.
# It's a method we can call on the Cat class without having to instantiate an instance first.
#e.g.
Cat.cats_count