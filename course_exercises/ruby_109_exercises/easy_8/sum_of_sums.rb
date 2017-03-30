def sum_of_sums(arr)
  total = []
  arr.reverse!
  0.upto(arr.size-1) do |x|
    total << arr[x..-1].inject(:+)
  end
  total.inject(:+)
end

#OR:

def sum_of_sums(arr)
  total = []
  0.upto(arr.size-1) do |x|
    total << arr[0..x].inject(:+)
  end
  total.inject(:+)
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35