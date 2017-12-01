#first try:

#class Sieve
#  def initialize(num)
#    @max = num
#    @range = (2..num)
#    @hash = make_hash
#  end
#  
#  def make_hash
#    hsh = {}
#    @range.each do |n|
#      hsh[n] = true
#    end
#    hsh
#  end
#  
#  def primes
#    @range.each do |num|
#      (num..@max).each do |multiplier|
#        position = num * multiplier
#        @hash[position] = false
#      end
#    end
#    @hash.select {|k, val| val == true}.keys
#  end
#end

#Last try:

class Sieve
  def initialize(num)
    @range = (2..num).to_a
  end
  
  def primes
    @range.each do |prime|
      @range.reject! { |multiple| (multiple != prime) && (multiple % prime == 0)}
    end
    @range
  end
end

#OR:
#class Sieve
#  attr_reader :numbers
#
#  def initialize(limit)
#    @numbers = [*(2..limit)]
#  end
#
#  def primes
#    primes = []
#
#    while (prime = numbers.delete_at(0))
#      primes << prime
#      numbers.delete_if { |number| number % prime == 0 }
#    end
#
#    primes
#  end
#end

#OR:
#
#class Sieve
#  attr_reader :range
#
#  def initialize(last_num)
#    @range = (2..last_num).to_a
#  end
#
#  def primes
#    range.each do |prime|
#      range.reject! { |num| (num != prime) && (num % prime == 0) }
#    end
#    range
#  end  
#
#end