matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
  ]

def transpose(matrix)
  new_array = []
  temp = []

  matrix.size.times do |x|
    matrix.each do |v|
      temp << v[x]
    end
    new_array << temp
    temp = []
  end

  new_array
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


#ALTERNATE option:

#def transpose(matrix)
#  matrix[0].zip(matrix[1]).zip(matrix[2]).map(&:flatten)
#end


#LAUNCH SCHOOL VERSION:

#def transpose(matrix)
#  result = []
#  (0..2).each do |column_index|
#    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#    result << new_row
#  end
#  result
#end