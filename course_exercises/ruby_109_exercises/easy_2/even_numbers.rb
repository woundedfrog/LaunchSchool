#number = 2
#
#while number <= 99
#  puts number
#  number += 2
#end

#or

#number = 1
#while number <= 99
#  puts number if number.even?
#  number += 1
#end

#or

range = (1..99)

range.select do |num|
p  num if num % 2 == 0
end
