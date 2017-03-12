def stringy(number)
  string = []
  range = (1..number)
  range.each do |digit|
    string << "1" if digit.odd?
    string << "0" if digit.even?    
  end
  string.join("")
end

#or
def stringy(number)
  string = []
  (1..number).each do |digit|
    digit = digit.odd? ? 1 : 0
    string << digit.to_s
  end
  string.join("")
end

#or

def stringy(number)
  string = []
  number.times do |digit|
    digit = digit.even? ? 1 : 0
    string << digit
  end
  string.join
end

puts stringy(6) == "101010"
puts stringy(9) == "101010101"
puts stringy(4) == "1010"
puts stringy(7) == "1010101"


#FURTHER EXPLORATION:

def stringy(number,alternate)
  string = []
  if alternate == 1
    number.times do |digit|
      digit = digit.even? ? 1 : 0
      string << digit
    end
  else
    number.times do |digit|
      digit = digit.even? ? 0 : 1
      string << digit
    end
  end
  string.join
end


puts stringy(6,1) == "101010"
puts stringy(9,0) == "010101010"
puts stringy(4,1) == "1010"
puts stringy(7,0) == "0101010"
