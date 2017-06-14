#Method Lookup (Part 2)
#
#Using the following code, determine the lookup path used when invoking cat1.color. Only list the classes and modules that Ruby will check when searching for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

#OUTPUT: => Cat => Animal => Object => Kernel => BasicObject ==> Undefined method error
#Every class is searched because there are no methods called 'color'.