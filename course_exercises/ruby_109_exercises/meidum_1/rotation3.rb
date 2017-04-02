def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars

  unrotated_part = digits[0..(-n - 1)]
  rotated_part = rotate_array(digits[-n..-1])

  (unrotated_part + rotated_part).join.to_i
end

def max_rotation(number)
  digits = number.to_s.chars

  number.to_s.size.downto(2) do |index|
    digits = rotate_rightmost_digits(digits.join.to_i, index).to_s.chars
  end

  digits.join.to_i
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845