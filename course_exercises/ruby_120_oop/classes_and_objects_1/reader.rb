class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

#OR:
#
#class Cat
#  def initialize(name)
#    @name = name
#  end
#
#  def name   #getter method
#    @name
#  end
#end

kitty = Cat.new('Sophie')
kitty.greet
#puts kitty.name