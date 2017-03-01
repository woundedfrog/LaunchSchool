puts 'What is your age in years?'
age = gets.chomp.to_i
months = age * 12

puts "You are #{months} months old."

#Further exploration:
#If a non-integer is entered, 0 is returned.