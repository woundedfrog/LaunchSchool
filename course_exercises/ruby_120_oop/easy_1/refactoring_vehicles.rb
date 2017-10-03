class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end

end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end
#Refactor these classes so they all use a common superclass, and inherit behavior as needed.

#FURTHER

#We could remove the wheels method from each class and add it as a 3rd(4th) parameter that's passed in as arguments into the initialize method when the objects are instantiated.
#Then we can just add a getter method for the 'wheels' instance variable.
#This will keep the code dry.