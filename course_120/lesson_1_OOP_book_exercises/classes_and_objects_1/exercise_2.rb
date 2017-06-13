#Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.


class MyCar
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

end

honda = MyCar.new(2016,"red","Honda Civic Type-R")
honda.speed_up(40)
honda.current_speed
honda.brake(10)
honda.current_speed
honda.shut_down
honda.current_speed
puts honda.year
puts honda.color
honda.color = ("Black")
puts honda.color
