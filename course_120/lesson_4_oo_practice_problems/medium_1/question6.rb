#If we have these two methods:

#class Computer
#  attr_accessor :template
#
#  def create_template
#    @template = "template 14231"
#  end
#
#  def show_template
#    template
#  end
#end
#and

class Computer
  #attr_accessor :template
  attr_reader :template
  attr_writer :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    template
  end
end
#What is the difference in the way the code works?

#ANSWER:
#In both examples the show_template method references the getter method, and so the 'self.' is not needed in the show_template method.
# The results of both examples are the same. Only how they accomplish the results are difficult.