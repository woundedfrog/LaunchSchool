def merge(array1, array2)
  result = array1.map { |value| value }
  return array2 if result.empty?

  array2.each_with_index do |value, index|
    position = result.index { |elem| elem > value }
    position = -1 if position == nil
    result.insert(position, value)
  end

  result
end

def merge_sort(array)
  return array if array.size <= 1

  left_side = array[0...array.size / 2]
  right_side = array[array.size / 2...array.size]

  left_side = merge_sort(left_side)
  right_side = merge_sort(right_side)

  merge(left_side, right_side)
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
