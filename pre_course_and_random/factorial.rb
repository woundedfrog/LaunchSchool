#define factorial_sum(num) method
#get an array of factorials of the given num
#sum them together
#sum the digits of the first time together.

def factorial_sum(num)
  range = (1..num)
  sum = range.inject do |sum, n|
    sum * n
  end
sum =  sum.to_s.split("").map {|digit| digit.to_i}
 sum.inject do |final, number|
   final + number
 end
  
end

#
#p factorial_sum(4) #== 6  #( 4! -> 24 -> 2 + 4 ->)
#p factorial_sum(10) # == 27 # (10! -> 3628800 -> 3+6+2+8+8+0+0 -> 27)
#p factorial_sum(50) # == 216
#p factorial_sum(100) # == 648