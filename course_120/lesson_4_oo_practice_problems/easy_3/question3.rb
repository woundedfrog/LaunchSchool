#When objects are created they are a separate realization of a particular class.

#Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

#ANSWER:
#We initialize two variables and assign the new instances of teh AngryCat class by using the keyword "new".
# since our initialize(constructor) method requires two arguments(age and name) we need to pass in those values when we instantiate the two objects. These arguments are then assigned to instance variables inside the class instances, which will return different information.

snuggles = AngryCat.new(2, "Snuggles")
smarty = AngryCat.new(4, "Smarty")

#To confirm this worked we do the following.
snuggles.name #=> "Snuggles"
smarty.name #=> "Smarty"