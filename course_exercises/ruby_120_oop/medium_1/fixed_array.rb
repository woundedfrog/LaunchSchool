#Fixed Array
#
#A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

#The above code should output true 15 times.

class FixedArray
  attr_reader :array

  def initialize(array_size)
    @array = Array.new(array_size)
  end

  def [](index)  #This is a getter method that takes 1 argument.
    array.fetch(index)
  end

  def []=(index,value) #this is a setter method that takes 2 arguments
    array.fetch(index)
    array[index] = value
  end

  def to_a  #this returns the array when called.
    array.clone  #we use Clone to avoid doing something unintended to the array.
  end

  def to_s #this returns the array in String format when called.
    to_a.to_s
  end
end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5
#
fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end
#
begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end
