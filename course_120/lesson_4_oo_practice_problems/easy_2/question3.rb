#How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
#What is the lookup chain for Orange and HotSauce?

#ANSWER
# We can find a class's ancestors by calling the method #.ancestors on a class. This asks the class for the information.
#It's called a method lookup chain because it traverses up the chain of classes and modules as it searches for methods.
#The HotSauce lookup chain is:
HotSauce.ancestors #=> [HotSauce, Taste, Object, Kernel, BasicObject]

#The Orange lookup chain is:
Orange.ancestors #=> [Orange, Taste, Object, Kernel, BasicObject]