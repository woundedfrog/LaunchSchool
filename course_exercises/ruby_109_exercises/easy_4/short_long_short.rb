#find shortest and longest strings.
#place the longest word in the middle, surrounded by the shortest word on either side.
#concatenate the strings.

def concat(long, short)
  contcat_str = short + long + short
end

def short_long_short(string, string2)
  shortest = ''
  longest = ''

  if string.size > string2.size
    longest = string
    shortest = string2
    return concat(longest, shortest)
  else
    longest = string2
    shortest = string
    return concat(longest, shortest)
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
puts short_long_short('', '') == ""