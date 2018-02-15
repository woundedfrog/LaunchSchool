class Palindromes

  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def largest_palindrome_from_single_digit_factors

  end

  def generate

  end
end

Palindromes.new(max_factor: 9)
