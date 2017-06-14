#Start the Engine (Part 1)
#
#Change the following code so that creating a new Truck automatically invokes #start_engine.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)  # every time a new object is instanciated, this method is run.
    super  #this allows the method call to traverse up the chain to find the year getter method. If we don't add super here, then this constructor(initialize method) will override the constructor from the Vehicle class.
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
#Expected output:
#
#Ready to go!
#1994