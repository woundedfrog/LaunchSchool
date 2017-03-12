def sum(num)
  sum = 0
  num.to_s.chars.map do |num|
    sum += num.to_i
  end
  sum
end

#or
def sum(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45