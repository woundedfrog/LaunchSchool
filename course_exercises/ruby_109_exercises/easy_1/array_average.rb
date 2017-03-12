def average(array)
  sum = array.inject {|sum, el| sum + el} 
  sum / array.size
end

puts average([1,5,87,45,8,8]) == 25
puts average([9,47,23,95,16,52]) == 40

#or

def average2(array2)
  array2.reduce(:+) / array2.size
end
puts average2([1,5,87,45,8,8]) == 25
puts average2([9,47,23,95,16,52]) == 40

#FURTHER EXPLORATION

def average_float(arr)
  sum =  arr.reduce(0.0) {|sum,el| sum+el }
  (sum.to_f / arr.size).round(1)
end

puts average_float([1,5,87,45,8,8]) == 25.7
puts average_float([9,47,23,95,16,52]) == 40.3
