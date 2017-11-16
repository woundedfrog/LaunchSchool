#From-To-Step Sequence Generator
#
#The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.
#
#Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.
#What do you think would be a good return value for this method, and why?
#
#Example:

def step(first, last, step)
  col_arr = []
  first.upto(last) do |num|
    if col_arr[-1] == (num - step) || col_arr.empty?
      col_arr << num
      yield(col_arr[-1])
    end
  end
  col_arr.last
end

step(1, 10, 3) { |value| puts "value = #{value}" }
#=>
#value = 1
#value = 4
#value = 7
#value = 10

