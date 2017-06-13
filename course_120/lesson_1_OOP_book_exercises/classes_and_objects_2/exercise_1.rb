#Add a class method to your MyCar class that calculates the gas mileage of any car.


class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year,color,model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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

end

honda = MyCar.new(2017,"blue","Civic Type-R")
puts honda.color
honda.spray_paint("Pink")
puts honda.color
MyCar.mileage(3,25)