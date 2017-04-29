def merge(array1, array2)
  index = 0
  result = []

  array1.each do |val|
    while index < array2.size && array2[index] <= val
      result << array2[index]
      index += 1
    end
    result << val
  end
   result.concat(array2[index..-1])
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]