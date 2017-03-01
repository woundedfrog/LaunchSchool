PASS = 'password'
UNAME = 'admin'
loop do
  user_name = ''
  user_password = ''


  puts '>> Please enter your username:'
  user_name = gets.chomp

  puts '>> Please enter your password:'
  user_password = gets.chomp

  break if user_name == UNAME && user_password == PASS
  puts ">> Invalid password or username"
end

puts "Welcome!"