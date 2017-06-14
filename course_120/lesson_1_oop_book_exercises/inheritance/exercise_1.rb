#Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
#
#Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

class Vehicle
  def self.mileage(gallons,miles)
    puts "#{miles / gallons} miles per gallon of gas"    
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  CAR_USE = "Show car"

  attr_accessor :color
  attr_reader :year

  def initialize(year,color,model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and the car accelerates to #{number} mph!"
  end

  def brake(number)
    @current_speed -= number
    puts "You hit the brakes and the car decelerates #{number} mph!"
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's put this baby in park."
  end

  def spray_paint(color)
    self.color = color
    puts "The new color of the car is #{color}. Nice work!"
  end

  def to_s
    puts "The car is a #{@color} #{@year} #{@model}."  
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  CAR_USE = "Work car"
end

honda = MyCar.new(2017,"blue","Civic Type-R")