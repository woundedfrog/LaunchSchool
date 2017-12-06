#Perfect Number
#
#The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.
#
#Perfect: Sum of factors = number
#Abundant: Sum of factors > number
#Deficient: Sum of factors < number
#Examples:
#
#6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
#28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
#Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
#Write a program that can tell if a number is perfect, abundant or deficient.
#
#Test suite:

require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end