def reverse!(list)
  list.sort! { |x,y| y <=> x } 
end

#OR:

#
#def reverse!(array)
#  left = 0
#  right = -1
#  loop do 
#    array[left], array[right] = array[right], array[left]
#    left += 1
#    right -= 1
#    break if left >= array.size / 2
#  end
#  array
#end 

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []