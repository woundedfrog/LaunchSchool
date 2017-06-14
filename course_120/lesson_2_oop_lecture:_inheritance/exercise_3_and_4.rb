#What is?
#The method lookup path is the order in which ruby searches for the invoked methods.
#If we start with "Bulldog" class, the lowest most subclass, and invoke the method 'speak', then it will search the Bulldog class for the method. 
#If the method is found, then it executes the that method and stops its traversal up the chain.
#If it does not find it, then it continues traversing up the chain until it finds the method or an error is returned when no method of that name is found.

#It's important to know how this works, because it helps understand how methods are found which helps with avoiding unintended bugs, such as overriting.

Bulldog.ancestors       # => [Bulldog, Dog, Pet, Object, Kernel, BasicObject]