num_array = []

puts "==> Enter the 1st number:"
num_array << first = gets.chomp.to_i
puts "==> Enter the 2nd number:"
num_array << second = gets.chomp.to_i
puts "==> Enter the 3rd number:"
num_array << third = gets.chomp.to_i
puts "==> Enter the 4th number:"
num_array << fourth = gets.chomp.to_i
puts "==> Enter the 5th number:"
num_array << fifth = gets.chomp.to_i
puts "==> Enter the last number:"
num_array << sixth = gets.chomp.to_i

if num_array.include?(sixth)
  puts "The number #{sixth} appears in #{num_array}."
else
  puts "The number #{sixth} does not appear in #{num_array}."
end