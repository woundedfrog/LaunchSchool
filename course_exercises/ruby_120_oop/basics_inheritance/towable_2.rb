#Towable (Part 2)
#
#Using the following code, create a class named Vehicle that, upon instantiation, assigns the passed in argument to @year. Both Truck and Car should inherit from Vehicle.

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_reader :year  #getter method so that we can call the YEAR instance method from outside the class
  
  def initialize(year)
    @year = year  #this method is initialised when an new object is created(instantiated). It assignes the passed in value to the isntance variable.
  end
end
class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year
#Expected output:
#
#1994
#I can tow a trailer!
#2006
#
