def center_of(string)
  index = string.size.even? ? (string.size/2)-1 : string.size/2

  if string.size.even?
    string[index..index+1]
  else
    string[index]
  end

end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'