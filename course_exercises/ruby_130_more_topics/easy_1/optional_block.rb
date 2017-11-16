#Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.
#
#Examples:

def compute
  block_given? ? yield : 'Does not compute.'
end


compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'


#Further Exploration
#
#Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.

def compute(*args)
  block_given? ? yield(*args) : 'Does not compute.'
end


p compute() { 5 + 3 } == 8
p compute('c') { |args| args.to_s + 'a' + 'b' } == 'cab'
p compute == 'Does not compute.'