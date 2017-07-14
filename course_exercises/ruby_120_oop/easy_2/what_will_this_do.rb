#What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end
  
  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new # => a new instantiated object
puts Something.dupdata # => "ByeBye" - This is because the class method is called on the class itself.
puts thing.dupdata # => "HelloHello" - THis is because an instance method is called on an instance(object) of the class.
#It won't call the class method because we are not calling it on the class, as with Something.dubdata.