#Given the following code...
#
#bob = Person.new
#bob.hi
#And the corresponding error message...
#
#NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
#from (irb):8
#from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'


ANSWER:

#The problem is that there is a method 'hi', but it is a private method. So it is unavailable to the object. I would fix this problem by moving the hi method above the private reserved word in the class.