def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3,4])
p my_method([5,6,7])


#The program printed the results it did because of the elsif was missing a conditional.
#since there is no conditional on the elsif line, it goes to the next line to find it. 
#The array.map call is used as a conditional. This works because .map returns an array. An array is always truthy. Thus the elsif branch is executed(As long as it isn't an empty array).
# 