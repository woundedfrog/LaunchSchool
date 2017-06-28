#Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

#ANSWER:
#To find out if a class has an instance variable, you can either look at the class(code) or ask the class.
#First method: By looking at the class we see a variable that arts with a single `@` sign.
#Instance variables are variables that start with a single `@` sign.

#Second method: There is another way and a more reliable way to check if a class has an instance variable. e.g. asking the class.

#There is a method called `instance_variables` which returns an array with all the instance variables of that object instance - if any.
#Example:
#First we need to instantiate two objects:
hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")
#now we can call the method on those objects.
p orange.instance_variables
#=> [] # An empty array is returned because the orange object contains zero instance variables.
p hot_pizza.instance_variables
#=> [:@name] # the pizza object contains 1 instance variable.