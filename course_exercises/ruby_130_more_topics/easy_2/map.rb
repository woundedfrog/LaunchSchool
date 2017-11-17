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

#alternative versions:

def map(collection)
  return [] if collection.empty?
  values = []
  
  collection.each { |*item| values << yield(*item) }
  
  values
end

#or:

def map(collection)
collection.each.with_object([]) { |item, arr| arr << yield(item) }
end

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


###########
#This version takes a Collection type and makes changes accoring to the block - Then returns the same class with new changes:

def map_and_convert(collection)
  return collection if collection.empty?
  class_t = collection.class.to_s
  values = []
  
  collection.each do |a, b|
    new = yield(a, b)
    if class_t == 'Hash'
      new = [a,b] if new.nil?
      new = [a,new] unless new.is_a?(Array)
    elsif new.nil?
      new = a
    end
      values << new 
    end
  
    case class_t
    when "Hash"
      values.to_h
    when "Set"
      values.to_set
    else
      values
    end
end

obj1 = {'a' => 'b', 'c' => 'd'}
obj2 = Set.new([1,2,3])
obj3 = [1, 3, 4, 8]
hash = { 1=> "m", 2=> "c", 3=> "s" }
set = Set[1, 3, 6]
puts''
puts "Map and restore original collection type"
puts "hashes"
p map_and_convert(obj1) { |k, v| [k,'a' + v] if k == 'a' || k == "d" }
p map_and_convert(obj1) { |k, v| [k * 3, v] }
p map_and_convert(hash) { |_, v| v += "at" }
p map_and_convert({}) { |value| true }
p map_and_convert(hash) { |value| false } 
p map_and_convert(hash) { |_, value| value.upcase }
puts '*******'
puts "Array"
p map_and_convert(obj3) { |k| k + 2 }
p map_and_convert([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map_and_convert([]) { |value| true } == []
p map_and_convert(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map_and_convert(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map_and_convert([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

puts "My Set"
p map_and_convert(obj2) { |value| value + 2 }.object_id
obj2.object_id
p map_and_convert(set) { |value| value**2 }
p map_and_convert(Set[]) { |value| true }
p map_and_convert(set) { |value| false } 
p map_and_convert(set) { |value| (1..value).to_a } 

