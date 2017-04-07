def triangle(s1,s2,s3)
  sides = [s1,s2,s3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when s1 == s2 && s2 == s3
    :equilateral
  when s1 == s2 || s1 == s3 || s2 == s3
    :isosceles
  else
    :scalene
  end
end

puts triangle(3,3,3) == :equilateral
puts triangle(3,3,1.5) == :isosceles
puts triangle(3,4,5) == :scalene
puts triangle(0,3,3) == :invalid
puts triangle(3,1,1) == :invalid