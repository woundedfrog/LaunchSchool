def swap_name(str)
  first, last = str.split(" ")
  "#{last}, #{first}"
end

#OR:

def swap_name(str)
  str.split(" ").reverse.join(", ")
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'