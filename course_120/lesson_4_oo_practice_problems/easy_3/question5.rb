If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer  #NoMethodError - manufacturer is a class method and can only be called on the Class itself.
tv.model  # model is an instance method and tv is an instance of the Television class, so we are able to call this method on the object without problems.

Television.manufacturer  # here we are able to call the manufacturer method on the Television class itself because it's a class method, unlike on line 15.
Television.model  #NoMethodError - model is an instance method and not a class method. Instance methods are only available to object instances of a class.