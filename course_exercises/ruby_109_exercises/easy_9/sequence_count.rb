def sequence(n1,n2)
  seq = []
  n1.times do |num|
    seq << n2 * (num+1)
  end
  seq
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []