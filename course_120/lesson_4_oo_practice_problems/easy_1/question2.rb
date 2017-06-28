#If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

#ANSWER:
#We can add the ability to "go_fast" to both classes by mixin in the module which has that method.
# In this case the 'Speed' module. We give access to the classes by mixin in the module using the Ruby reserve word "include".
#e.g.
class Car
  include Speed
  #omitted code
end

class Truck
  include Speed
  #omitted code
end

#To verify that the classes no have access to the 'go_fast' method we do the following:
blue_truck = Truck.new #instantiates a new object and assign it to the variable 'blue_truck'
blue_truck.go_fast # We call the 'go_fast' method on the instantiated object.
#=> I am a Truck and going super fast!

small_car = Car.new
small_car.go_fast
#=>I am a Car and going super fast!