def is_double?(num)
  idx = num.size.even? ? (num.size/2)-1 : num.size/2
  first, last = num[0..idx], num[idx+1..-1]
  if first == last
    true
  end

end

def twice(num)
  if num.to_s.size == 2 && is_double?(num.to_s)
    num
  elsif is_double?(num.to_s)
    num
  else
    num = num * 2
  end
end


puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10