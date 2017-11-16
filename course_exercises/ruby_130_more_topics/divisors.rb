#Divisors
#
#Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.
#
#Examples

#def divisors(num)
#  divisors = []
#  (1..num).each do |n|
#    divisors << n if num % n == 0
#  end
#  divisors
#end

#or

#def divisors(number)
#  1.upto(number).select do |divisors|
#    number % divisors == 0
#  end
#end


#Further:

def divisors(number)
  result = []

  (1..number).each do |divisors|
    if number % divisors == 0
      break if result.include?(divisors)
      result << divisors
 p     result << number/divisors unless number == divisors**2
    end
  end

 p result.sort
end


#divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
divisors(999991231)
