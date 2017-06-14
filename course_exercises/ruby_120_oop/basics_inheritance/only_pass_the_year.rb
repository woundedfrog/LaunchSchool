#Only Pass the Year
#
#Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type #because we call the instance variable on our Truck instanciated object, we need a Getter method for that instance variable, allowing us to call it outside of the class.
  
  def initialize(year,bed_type)  #adds a second argument/variable
    super(year) #we pass the YEAR to the super call which pass only YEAR tot he Vehicle class. Without the argument, it will attempt to pass both arguments.
    @bed_type = bed_type  #assigning the argument to an instance variable.
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
#Expected output:
#
#1994
#Short