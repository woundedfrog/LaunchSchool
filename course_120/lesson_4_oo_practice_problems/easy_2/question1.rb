#You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
#What is the result of calling

oracle = Oracle.new  #=> #<Oracle:0x0000000282c70> A new instantiated object
oracle.predict_the_future  #=> "You will <eat a nice lunch>"   *results may vary. string inside <> are chosen randomly each time the method is called.