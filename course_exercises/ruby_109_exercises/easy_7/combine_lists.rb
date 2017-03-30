def interleave(a1,a2)
  new_array = []
  a1.size.times do |x|
    new_array << a1[x]
    new_array << a2[x]
  end

  new_array
end

#OR:

def interleave(a1, a2)
  a1.zip(a2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']