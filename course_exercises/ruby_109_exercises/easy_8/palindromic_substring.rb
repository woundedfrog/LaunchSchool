require 'pry'

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

def palindrome?(str)
  str == str.reverse
end

def palindromes(str)
  palindromes = []
  substrings(str).each do |string|
    if string.size > 1 && palindrome?(string)
      palindromes << string
      binding.pry
    end
  end
    palindromes

end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
  ]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
  ]