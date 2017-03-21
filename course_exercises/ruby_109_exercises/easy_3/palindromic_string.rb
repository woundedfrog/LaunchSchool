def palindrome?(string)
  string == string.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

def palindrome?(array)
  array == array.reverse
end

puts palindrome?([5,3,3,5]) == true
puts palindrome?([5,3,3]) == false