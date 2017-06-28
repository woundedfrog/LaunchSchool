#In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end
#When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

small_car = Car.new
p small_car.go_fast
#I am a Car and going super fast!

#ANSWER:
#By using `self.class`
#1) Using `self` refers to the object itself. The `Car` or `Truck` objects.
#2) By calling #.class method on the the `self` which is refering to itself(the object), it tells us what class it is. So it returns the class.
#3) Since we are using string iterpolation, the #to_s method is automatically called on self.class and thus is printed out as a string.
