def multiply_list(a1,a2)
  new_a = []
  a1.map.with_index do |x,i|
    new_a << (x * a2[i])
  end
  new_a
end

#OR:

def multiply_list(a1,a2)
  new_a = []
  0.upto(a1.size - 1) do |x|
    new_a << a1[x] * a2[x]

  end
  new_a
end


puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]