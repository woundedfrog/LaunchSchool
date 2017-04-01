def substrings_at_start(str)
  sub_array = []

  0.upto(str.size-1) do |x|
    sub_array << str[0..x]
  end

  sub_array
end

def substrings(str)
  new_a = []
  str.size.times do |i|
    new_a <<  substrings_at_start(str[i..-1])
  end
  
  new_a.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
  ]