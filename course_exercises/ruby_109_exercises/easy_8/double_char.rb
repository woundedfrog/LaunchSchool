def repeater(str)
  doubled_string = []
  str.chars.each do |char|
    doubled_string << (char * 2)
  end

  doubled_string.join("")
end

#OR:

def repeater(str)
  doubled_string = ""
  str.chars.each do |char|
    doubled_string += (char * 2)
  end

  doubled_string
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''