def merge(a1,a2)
  new_a = []
  idx = 0
  loop do 
    new_a << a1[idx]
    new_a << a2[idx]
    idx += 1
    break if new_a.size == (a1+a2).size
  end
  new_a.uniq.sort
end

#OR:

def merge(a1,a2)
  new_a = a1 + a2
  new_a.uniq.sort
end

#OR:

def merge(a1,a2)
  a1.concat(a2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]