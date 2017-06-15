class Machine

  def start
    flip_switch(:on)  #self is removed since the flip_switch is a private method.
  end

  def stop
    flip_switch(:off) #self is removed since the flip_switch is a private method.
  end

  private  #the following code is private. Can be called from within the class(not outside). The setter method and flip_switch is now private.
  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state  #we use the Self keyword, otherwise 'switch' is regarded as a local method.
  end
end

tablet = Machine.new
p tablet.start

#FURTHER:

#class Machine
#
#  def start
#    flip_switch(:on)  #self is removed since the flip_switch is a private method.
#  end
#
#  def stop
#    flip_switch(:off) #self is removed since the flip_switch is a private method.
#  end
#  
#  def status
#    "Call 'switch_status' to view switch."
#  end
#  
#  def switch_status
#   puts switch
#  end
#  
#  private  #the following code is private. Can be called from within the class(not outside). The setter method and flip_switch is now private.
#  attr_accessor :switch 
#
#  def flip_switch(desired_state)
#    self.switch = desired_state  #we use the Self keyword, otherwise 'switch' is regarded as a local method.
#  end
#end
#
#tablet = Machine.new
#p tablet.start
#p tablet.status
# tablet.switch_status