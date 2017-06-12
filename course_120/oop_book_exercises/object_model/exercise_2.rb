#What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.


#1. Modules are like classes. They can contain shared behaviours, but they cannot create Objects.
#2. A Module is a collection of behaviours that is reusable in other classes via MIXINs.
#3. To use modules in classes, we declare them inside of a class using the reserved word "include". The module's behaviours are now available to that class and its objects.

module Inquire
 
end

class MyClass
  include Inquire
end

an_object = MyClass.new