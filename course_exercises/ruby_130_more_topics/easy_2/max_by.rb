#max_by
#
#The Enumberable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.
#
#Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.
#
#If the Array is empty, max_by should return nil.
#
#Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.
#
#Examples:


#These are three variations of the max_by method.
#E1 follows LS's solution.
#E2 I used sort_by to sort the elements according to the block return. 
#E3 I used an each method.
#For E2 and E3 I added a second argument to return the `n` number of elements.
#I also added an edge case that returns the first element in the array if the block returns anything that isn't a `String` or `Fixnum`.
#  

def max_by(array, max_ele = 1)
  return nil if array.empty?
  return array[0] if ![String, Fixnum, Integer].include?(yield(array[0]).class)
  result = array.sort_by do |val|
    if [String, Fixnum, Integer].include?(yield(val).class)
      yield(val).ord
    end
  end
  max_ele == 1 ? result[-1] : result.last(max_ele).reverse
end

#OR:

def max_by(array, max_ele = 1)
  return nil if array.empty?
  largest_val = array.first
  return array[0] unless [String, Fixnum, Integer].include?(yield(largest_val).class)
  
  initial_val = yield(largest_val)
  array.drop(1).each do |val|
    yielded = yield(val)
    if initial_val < yielded
      largest_val = val
      initial_val = yielded
    end
  end

  largest_val
end

def max_by(array, max_ele = 1)
  return nil if array.empty?
  largest_val = array.first
  return array[0] unless [String, Fixnum, Integer].include?(yield(largest_val).class)
  
  initial_val = yield(largest_val)
  result = [largest_val]
  array.drop(1).each do |val|
    yielded = yield(val)
    if initial_val < yielded
      largest_val = val
      result << val
      initial_val = yielded
    end
  end
  
  max_ele == 1 ? result[-1] : result.last(max_ele).reverse
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
puts ''
puts 'Extra edge cases'
array = [[1, 2], [3, 4, 5], [6]]
p max_by(array, 2) { |v| nil } == [1, 2] 
p max_by(array) { |v| } ==  [1, 2] 
p max_by(array) { |v| true } == [1, 2] 
p max_by(array) { |v| false } == [1,2]
p max_by(array) { |v| {} } == [1, 2]
p max_by(array) { |v| 1.2343 } == [1, 2]
p max_by(array) { |v|  } == [1, 2]
p max_by([1, 2, 3, 4]) { |value| (1..10) } == 1

puts ''
puts "max_by return n number of elements"
p max_by([1,2,3,4,5,6], 3) { |value| value } == [6, 5, 4]
p max_by([[1,2,4],[5,3,6,2],[20,1]], 2) { |value| value.size } == [[5, 3, 6, 2], [1, 2, 4]]
p max_by([[1,2,4],[5,3,6,2],[20,1]], 0) { |value| value.size } == [] 
