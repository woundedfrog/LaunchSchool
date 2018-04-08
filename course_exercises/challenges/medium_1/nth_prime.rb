# Nth Prime
# Write a program that can tell you what the nth prime is.
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# Do not use Ruby's Prime class nor any of the prime-number testing methods in the Integer class. For an algorithm to determine whether a number is prime, check out this article.
require 'pry'
class Prime

  def self.nth(nth)
    raise ArgumentError if nth < 1
    primes = get_array(nth)
    primes.last
  end

  def self.get_array(nth)
    number = 2
    arr = []
    loop do
      arr << number if !is_prime?(number)
      number += 1
      break if arr.size >= nth
    end
    arr
  end

  def self.is_prime?(num)
    range = (2..num-1)
    range.any? { |divisor| num % divisor == 0 }
  end
end
