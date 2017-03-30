def show_multiplicative_average(arr)
  total = arr.inject(:*)
  average = total / arr.size.to_f
  format("%.3f",average)
end

puts show_multiplicative_average([3, 5])
#The result is 7.500

puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
#The result is 28361.667