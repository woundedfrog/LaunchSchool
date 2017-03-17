puts ">> Please enter an integer greater than 0."
num1 = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
s_or_p = gets.chomp.downcase




if s_or_p == 's'
  sum = (1..num1).inject(:+)
  puts "** The sum of the integers between 1 and #{num1} is #{sum}. **"
else  
  product = (1..num1).inject(:*)
  puts "** The product of the integers between 1 and #{num1} is #{product}. **"
end