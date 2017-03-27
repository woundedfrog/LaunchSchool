NUMBERS = {
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

def string_to_integer(string)
  digits = string.chars.map do |char| 
    NUMBERS[char]
  end

  number = 0
  digits.each do |num|
    number = 10 * number + num
  end
  number
end

def string_to_signed_integer(string)
  sign = string.start_with?("+", "-") ? string[0] : ""
  number = string.delete(sign)

  case sign
    when "-" then -string_to_integer(number)
    else           string_to_integer(number)
  end
end

  p string_to_signed_integer('4321') == 4321
  p string_to_signed_integer('-570') == -570
  p string_to_signed_integer('+100') == 100
  p string_to_signed_integer('+66814') == 66814
  p string_to_signed_integer('-5491') == -5491