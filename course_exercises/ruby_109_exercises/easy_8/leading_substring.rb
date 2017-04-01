def substrings_at_start(str)
  sub_array = []

  0.upto(str.size-1) do |x|
    sub_array << str[0..x]
  end

  sub_array
end

#OR:

def substrings_at_start(str)
  substring = ""
  sub_array = []

  str.chars.each do |character|
    substring += character
    sub_array << substring
  end

  sub_array
end


puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']