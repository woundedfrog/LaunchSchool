def multiply_all_pairs(a1, a2)
  n_array = []

  a2.each_with_index do |val,i|
    a1.each do |x|
      n_array << x * val
    end
  end

  n_array.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]