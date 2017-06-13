#Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.



#NOT FINISHED YET


class Vehicle
  attr_accessor :color
  attr_reader :year
  @@number_of_vehicles = 0

  def initialize(year,color,model)
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

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  CAR_USE = "Work car"
end

honda = MyCar.new(2017,"blue","Civic Type-R")
toyota = MyCar.new(2000,"orange","Toyota Supra")
chevy = MyTruck.new(2010,"brown","Chevy Bolt")
puts Vehicle.number_of_vehicles