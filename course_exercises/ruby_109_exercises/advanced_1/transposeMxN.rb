def transpose(matrix)
  new_array = []
  temp = []

  matrix.flatten.size.times do |idx1|
    matrix.each do |val|
      break if val[idx1] == nil
      temp << val[idx1]
    end
    new_array << temp
    temp = []
  end
  result = new_array.select do |element|
    element if element != []
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]

p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


#ALternate option:

#def transpose(matrix)
#  transposed = []
#  columns = matrix.size
#  rows = matrix.first.size
#  0.upto(rows - 1) do |i|
#    transposed[i] = matrix.map { |row| row[i] }
#  end
#  transposed
#end


#Launch school version:

#def transpose(matrix)
#  result = []
#  number_of_rows = matrix.size
#  number_of_columns = matrix.first.size
#  (0...number_of_columns).each do |column_index|
#    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
#    result << new_row
#  end
#  result
#end
