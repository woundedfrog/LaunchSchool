class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur)
    super(name, age)
    @fur = fur
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@fur} fur"
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
#Update this code so that when you run it, you see the following output:
#
#My cat Pudding is 7 years old and has black and white fur.
#My cat Butterscotch is 10 years old and has tan and white fur.


#Further Exploration
#
#An alternative approach to this problem would be to modify the Pet class to accept a colors parameter. If we did this, we wouldn't need to supply an initialize method for Cat.
#
#Why would we be able to omit the initialize method? Would it be a good idea to modify Pet in this way? Why or why not? How might you deal with some of the problems, if any, that might arise from modifying Pet?

#ANSWER:

#If we modify the PETS class, it makes that class less broad and limits the reusability. 
#We could then omit the initialize method in the Cat class since it will inherit all the needed behaviour from the Pet class.
    
#If we modify Pet class, we would have to compensate later on if we wanted to use that for any object that doesn't need colors. Which means we would need to be aware of this.