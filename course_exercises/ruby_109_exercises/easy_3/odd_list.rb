#Returns 1st, 3rd, 5th
def oddities(array)
  new_arr = []
  array.each_with_index do |ele,i|
    new_arr << ele if i.even?
  end
  new_arr
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

