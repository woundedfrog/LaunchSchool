#Towable (Part 1)
#
#Using the following code, create a Towable module that contains a method named tow that prints I can tow a trailer! when invoked. Include the module in the Truck class.

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable #we add the attributes from tehe module to this class by using the reserve word "include". We can have unlimited number of modules in a single class.
end

class Car
end

truck1 = Truck.new
truck1.tow
#Expected output:
#
#I can tow a trailer!