#Start the Engine (Part 2)
#
#Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)  #this instance method takes one argument
    super() + " Drive #{speed}, please!"  # we append the 'drive..' string to the super call. We use empty parentheses, which means no arguments are to be passed in. 
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
#Expected output:
#
#Ready to go! Drive fast, please!