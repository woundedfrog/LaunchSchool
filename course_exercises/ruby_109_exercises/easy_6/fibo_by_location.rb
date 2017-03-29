def find_fibonacci_index_by_length(num)
  seq = []
  n1 = 1
  n2 = 1
  loop do 
    seq << n1
    n1,n2=n2,n1+n2
    break if seq[-1].to_s.size == num
  end
seq.index(seq[-1]) + 1
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847