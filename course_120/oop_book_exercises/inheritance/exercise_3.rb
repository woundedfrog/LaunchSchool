#Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

module VehicleInfo
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0

  def initialize
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.mileage(gallons,miles)
    puts "#{miles / gallons} miles per gallon of gas"    
  end

end

class MyCar < Vehicle
  include VehicleInfo
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
toyota = MyCar.new(2000,"orange","Toyota Supra")
chevy = MyTruck.new
puts Vehicle.number_of_vehicles
puts honda.can_tow?(200)