#We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
#What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future  #=>  "You will <something>" -> the <something> is replaced by a random element from the array on line 15 - every call.
#This is because the choices method in teh RoadTrip class overrites the choice method in the Oracle class.
#When we call the predict_the_future method on the RoadTrip class, it searches up the hierarcy chain until it finds the method. However, since we call the method on the RoadTrip class and not the Oracle class, the choice method on line 14 overrites the one on line 8.
