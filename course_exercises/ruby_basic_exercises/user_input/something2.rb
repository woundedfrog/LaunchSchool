def get_answer
  loop do
    user = gets.chomp.downcase
    return user if user == 'y' || user == 'n'
    puts "Only y or n are accepted- Case does not matter!"
  end
end

puts "Would you like me to print something?(y/n)"
user = get_answer

if user == 'y'
  p "I am printing at your request!!"
end


#OR
puts ">>>> Version 2"
user = ''
loop do 
  puts 'Would you like to print something?(y/n)'
  user = gets.chomp.downcase
  break if %w(y n).include?(user)
  puts "That's an invalid input! Enter y or n"
end
puts 'This is printing at your request.' if user == 'y'