DIGITS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
  }

def word_to_digit(str)
  DIGITS.each do |k,v|
    str.gsub!(/\b#{k}\b/,v)
  end
  str
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
#
#def word_to_digit(str)
#words = str.split(" ").map do |word|
#  if DIGITS[word] == nil
# p word
#  else
#    DIGITS[word].to_s
#end
#end
#p words.join(" ")
#
#end