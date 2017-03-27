CONST = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0
  }

def string_to_integer(str)
  digit = str.chars.map do |char|
    CONST[char]
  end
  number = 0
  digit.each { |digit| number = 10 * number + digit }
  number
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570