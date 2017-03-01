PASS = 'password'

loop do
  puts '>> Please enter your password:'
  user_password = gets.chomp
  if user_password == PASS
    puts "Welcome!"
    break
  end
    puts ">> Invalid password!"

end