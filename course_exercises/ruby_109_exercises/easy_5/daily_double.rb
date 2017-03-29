def crunch(string)
  new_string = []
  string = string.split("")
  string.each_with_index do |let, i|
    new_string << let unless let == string[i+1]
  end
  new_string.join("")
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''