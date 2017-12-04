=begin
1. if no argument is passed with the object instantiation
the default Multiples are 3 and 5
if a arg is given, then multiples = that num
2. create new var and assign empty array.
3. scan range from (1 - given number) that's passed to the method call.
4. Iterate
if current num is a multiple of any of the Multiples numbers,
then pass it to the the array.
end
5. reduce the numbers and find teh sum.
=end

#class SumOfMultiples
#  def initialize(*multiples)
#    multiples.empty? ? @multipliers = [3,5] : @multipliers = multiples
#  end
#  
#  def self.to(limit)
#    sum = self.new(3,5)
#    sum.to(limit)
#  end
#  
#  def to(limit)
#    format_number(limit)
#  end
#
#  private
#
#  def format_number(limit)
#    multiples = []
#    (1..limit-1).each do |num|
#      multiples << num if multiple_of(num)
#    end
#    multiples.inject(0) { |sum, num| sum += num }
#  end
#  
#  def multiple_of(num)
#    @multipliers.any? { |mul| num % mul == 0 }
#  end
#end

#OR:

class SumOfMultiples
  def initialize(*multiples)
    @multipliers = multiples
  end

  def self.to(limit, multiples = [3,5] )
    digits = []
    (1..limit-1).each do |num|
      digits << num if multiples.any? { |multiple| num % multiple == 0 }
    end
    digits.inject(0) { |sum, num| sum += num }
  end

  def to(limit)
    self.class.to(limit, @multipliers)
  end
end
