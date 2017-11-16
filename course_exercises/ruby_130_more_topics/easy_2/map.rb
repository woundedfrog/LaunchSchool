#map
#
#Lets return to implementing existing core ruby methods to learn about blocks.
#
#The Enumerable#map method iterates over the members of a collection, using the associated block to perform some sort of operation on each collection member. The returned values from the block are then built up into an Array that is then returned to the caller. Note in particular that every time #map yields to the block, it obtains just one value. That value may be a complex value - it may even be another collection - but it is nevertheless just one value. Thus, #map returns an Array that has the same number of elements that the original collection had.
#
#Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.
#
#If the Array is empty, map should return an empty Array, regardless of how the block is defined.
#
#Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.
#
#Examples:
require 'set'

def map(array)
  return [] if array.empty?
  new_array = []
  for *val in array
    new_array << yield(*val)
  end
  new_array
end

#This version takes a Collection type and makes changes accoring to the block - Then returns the same class with new changes:

def map(collection)
  return collection if collection.empty?
  class_t = collection.class
  values = []
  
  collection.each { |*item| values << yield(*item) }
  
    case class_t.to_s
    when "Array"
      values.to_a
    when "Hash"
      values.to_h
    else
      values.to_set
    end
end

obj1 = {'a' => 'b'}
obj2 = Set.new([1,2,3])
obj3 = [1, 3, 4]

puts "Hash"
p map(obj1) { |k, val| [k, val * 2] }
puts "Set"
p map(obj2) { |value| value + 2 }
puts "Array"
p map(obj3) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

puts "More arrays"
p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]


#This version acts more like the Included #.map that is in Ruby, but is not as useful, imo.

def map(collection)
  return [] if collection.empty?
  class_t = collection.class
  values = []
  
  collection.each { |*item| values << yield(*item) }
  
  values
end

puts ''
puts 'Mixed Collections'
hash = { 1=> "m", 2=> "c", 3=> "s" }
set = Set[1, 3, 6]

p map(hash) { |_, v| v += "at" } == ["mat", "cat", "sat"]
p map(set) { |value| value**2 } == [1, 9, 36]
p map({}) { |value| true } == []
p map(Set[]) { |value| true } == []
p map(hash) { |value| false } == [false, false, false]
p map(set) { |value| false } == [false, false, false]
p map(hash) { |_, value| value.upcase } == ['M', 'C', 'S']
p map(set) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4, 5, 6]]
