def swapcase(string)
  new_s = string.chars.map do |x|
    if x == x.upcase
      x = x.downcase
    elsif x == x.downcase
      x = x.upcase
    else
      x
    end
  end
  new_s.join("")
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'