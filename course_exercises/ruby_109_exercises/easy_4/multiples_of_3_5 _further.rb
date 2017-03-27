def multisum(num)
  new_arr = (1..num).select do |num|
    num % 3 == 0 || num % 5 == 0
  end
  new_arr.inject(:+)
end

#or
#def multisum(num)
#  (0..num).inject do |sum, number|
#    sum += number if number % 3 == 0 || number % 5 == 0
#    sum
#  end
#end


puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168