#Exploring Procs, Lambdas, and Blocks: Definition and Arity
#
#For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.
thing = "!I'm a thing!"
# Group 1
#my_proc = proc { |thing| puts "This is a #{thing}." }
#puts my_proc
#puts my_proc.class
#my_proc.call
#my_proc.call('cat')
  
  #observation:
#1)A new proc object can be created by calling #.new or by calling `proc`.
#2) A proc is an object of the Proc class.
#3) A proc object doesn't require the exact count of arguments to be passed to it. If zero are passed, nil is assigned to the block variables.
  
#
## Group 2
#my_lambda = lambda { |thing| puts "This is a #{thing}" }
#my_second_lambda = -> (thing) { puts "This is a #{thing}" }
#puts my_lambda
#puts my_second_lambda
#puts my_lambda.class
#my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

#Observations:
#1) A lambda object can be createdy by calling `lambda` or `->`. It cannot be created by calling `lambda.new`.
#2) A lambda is a type of Proc.
#3) A displayed lambda includes (lambda) in it, while Procs do not.
#4) A lambda enforces argument count. If it needs 1, you have to pass only 1 - if 10, then 10, if zero, then zero. Else an error is thrown.

## Group 3
#def block_method_1(animal)
#  yield
#end
#
#block_method_1('seal') { |seal| puts "This is a #{seal}."}
#block_method_1('seal')

#Observations:
#1) blocks do not enforce arguments. Nil is assigned to block variables that do not have arguments yielded to it.
#2) If yield is used inside the method, the method call(invocation) needs to have a block. If there is no block when the method yields, then a LocalJumpError is thrown.


## Group 4
#def block_method_2(animal)
#  yield(animal)
#end
#
#block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
#block_method_2('turtle') do |turtle, seal|
#  puts "This is a #{turtle} and a #{seal}."
#end
#block_method_2('turtle') { puts "This is a #{animal}."}

#Observation:
#1) Any extra arguments that are passed to a block will result in all unused block variables to assigned to `nil`.
#2) Block will throw and error if you attempt to reference an unintialized variable or one that doesn't exist in the block's scope.


#COMPARISons:

#Blocks, Procs, Lambdas are all ways to group code called closures. 
#A `block` is nameless and the basic form of a closure, and also very forgiving regarding parameters and quicker to define and use.
#A Proc and lambdas are blocks stored(contained) as a type of object. These can be given names by which to reference them. These sort of blocks can be reused with different methods.
#
#  lambdas enforce argument count, while Blocks and Procs DO NOT.
A lambda is similar to a proc, but 