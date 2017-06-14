#Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

module VehicleInfo
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle

  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(year, color,model)   
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.mileage(gallons,miles)
    puts "#{miles / gallons} miles per gallon of gas"    
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
    puts "The vehicle is a #{@color} #{@year} #{@model}."  
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  CAR_USE = "Show car"
  include VehicleInfo

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  CAR_USE = "Work car"
end

lumina = MyCar.new(1997, 'white', 'chevy lumina')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors