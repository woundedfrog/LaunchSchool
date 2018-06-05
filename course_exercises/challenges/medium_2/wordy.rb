# Wordy
#
# Write a program that takes a word problem and returns the answer as an integer.
#
# E.g.
#
# What is 5 plus 13?
#
# The program should return 18.
#
# What is 7 minus 5 minus 1?
#
# The program should return 1.
#
# Remember, that these are verbal word problems, not treated as you normally would treat a written problem. This means that you calculate as you move forward each step. This means 3 + 2 * 3 = 15, not 9.
#
# Hint: to solve this problem elegantly, you need to know how the send method works in Ruby. If you haven't seen it before, check it out here.

# input: string with numbers and words that form a math word problem.
#
# output: solution to the math problem from input.
#         scan words and change words to actual corresponding values.
#         problem is read from left to right.

class WordProblem

  OPERATORS = {'plus'=> '+', 'minus'=> '-', 'multiplied' => '*', 'divided' => '/'}

  attr_accessor :string_arr

  def initialize(string_problem)
    @string_arr = string_filter(string_problem)
    raise ArgumentError, 'Invalid question' if string_arr.size < 3
  end

  def answer
    while string_arr.size > 1
      calculator
    end
    string_arr.first
  end

  private

  def string_filter(string_problem)
    OPERATORS.keys.each do |oper|
      string_problem.gsub!(oper, OPERATORS[oper])
    end
    string_problem.gsub(/[^0-9\/\*\-\+\s+]/,'').split(" ")
  end

  def calculator
    val1, operator, val2 = string_arr.shift(3)
    val1 = val1.to_i
    val2 = val2.to_i
    sub_total = val1.public_send(operator.to_sym, val2)
    string_arr.unshift(sub_total)
  end
end
