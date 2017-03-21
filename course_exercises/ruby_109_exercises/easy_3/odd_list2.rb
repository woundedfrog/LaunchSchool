#FURTHER EXPLORATION:
#Returns 2nd, 4th, 6th
def evens(array)
  new_arr = []
  array.each_with_index do |ele,i|
    new_arr << ele if i.odd?
  end
  new_arr
end

puts evens([2, 3, 4, 5, 6]) == [3, 5]
puts evens(['abc', 'def']) == ['def']
puts evens([123]) == []
puts evens([]) == []

#OTHER SOLUTIONS:

#Returns 1st, 3rd, 5th
def oddities(array)
  index = 0
  new_arr = []
  while index < array.size
    new_arr << array[index]
    index += 2
  end
  new_arr
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

#Returns 1st, 3rd, 5th
def oddities2(array)
  index = 0
  new_arr = []
  until index >= array.size
    new_arr << array[index]
    index += 2
  end
  new_arr
end

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []