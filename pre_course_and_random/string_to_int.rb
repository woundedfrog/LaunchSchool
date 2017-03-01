DIGITS =  ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

#string_to_integer('4321') == 4321
#string_to_integer('570') == 570

def string_to_signed_integer(string)
  sum = 0
  string.delete('+-').chars.each do |num|
    sum = (sum * 10) + DIGITS.index(num)
  end
  string.include?('-') ? - sum : sum
end

#string_to_signed_integer('4321') == 4321
#string_to_signed_integer('-570') == -570
#string_to_signed_integer('+100') == 100

def integer_to_string(number)
  num_array = Array.new
  num_array << 0 unless number > 0 
  until number == 0
    num_array << number % 10
    number = number / 10
  end
  num_array.join.reverse
end

#puts integer_to_string(4321) == '4321'
#puts integer_to_string(0) == '0'
#puts integer_to_string(5000) == '5000'


def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
    
#puts signed_integer_to_string(4321) == '+4321'
#puts signed_integer_to_string(-123) == '-123'
#puts signed_integer_to_string(0) == '0'