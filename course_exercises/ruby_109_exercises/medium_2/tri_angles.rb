def triangle(angle1,angle2,angle3)
angles = [angle1,angle2,angle3]

  case
    when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
    when angles.include?(90)
    :right
    when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid