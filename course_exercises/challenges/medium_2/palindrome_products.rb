require 'pry'
class Palindromes

  Palindrome = Struct.new(:factors, :value)

  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    @min_factor.upto(@max_factor).each do |n1|
      @min_factor.upto(@max_factor).each do |n2|
        total = (n1 * n2)
        if total.to_s.reverse.to_i == total
          #
          @palindromes[total] << [n1, n2] if  @palindromes.values.flatten(1).include?([n1,n2]) == false && @palindromes.values.flatten(1).include?([n2,n1]) == false
        end
      end
    end
  end

  def largest
    palindrome = @palindromes.to_a.sort.last
    Palindrome.new(palindrome[1], palindrome[0])
  end

  def smallest
    palindrome = @palindromes.to_a.sort.first
    Palindrome.new(palindrome[1], palindrome[0])
  end

end
