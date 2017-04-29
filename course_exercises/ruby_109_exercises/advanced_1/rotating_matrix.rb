matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
  ]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
  ]


def transpose(matrix) #this method transposes only once.(closewise)
  new_array = []
  temp = []

  matrix.flatten.size.times do |idx1|
    matrix.each do |val|
      break if val[idx1] == nil
      temp << val[idx1]
    end
    new_array << temp unless temp == []
    temp = []
  end
  new_array
end

def rotate90(matrix)  #This reverses the method above.(counter-clockwise transpose)
  transpose(matrix.reverse)
end

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2


#ALTERNATE option  (This combines the above to methods into one)

#def rotate90(matrix)
#  rotated_rows_count = matrix.first.size
#  rotated_matrix = []
#  (0...rotated_rows_count).each do |row_index|
#    rotated_matrix[row_index] = matrix.reverse.map { |i| i[row_index] }
#  end
#  rotated_matrix
#end


#FURTHER: Rotate 90' 180 360' based on argument

def rotate901(matrix,rotate_count = 1)  #this method rotates the matrix clockwise 'n' number of times. Default = 1
  rotate_count.times do
    matrix = transpose(matrix.reverse)
  end
  matrix
end


new_matrix1 = rotate901(matrix1, 3)
new_matrix2 = rotate901(matrix2, 3)

p new_matrix1 == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]
p new_matrix2 == [[2, 8], [4, 0], [7, 1], [3, 5]]

#LAUNCH SCHOOL VERSION: