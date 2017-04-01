def buy_fruit(array)
  new_arr = []
  count = 1
  array.each do |ele|
    ele[1].times do |x|
      new_arr << ele[0]
    end
  end
  new_arr
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]