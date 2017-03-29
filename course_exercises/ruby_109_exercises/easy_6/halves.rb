def halvsies(arr)
  a =[]
  b = []
  if arr.size % 2 == 0
    a << arr[0..((arr.size / 2)-1)]
    b << arr[(arr.size/2)..-1]
  else
    a << arr[0..(arr.size / 2)]
    b << arr[((arr.size/2)+1)..-1]
  end
  a = a + b
end

#OR:

def halvsies(arr)
  split = arr.size.even? ? (arr.size / 2) - 1 : arr.size / 2
  new_a =  [arr[0..split],arr[(split+1)..-1]]
end


puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]