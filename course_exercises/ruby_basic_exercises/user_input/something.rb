puts "Would you like me to print something?(y/n)"
user = gets.chomp.downcase

if user == 'y'
  p "I am printing at your request!"
end

#Further exploration:
#if a capital Y is entered, nothing is printed. This is fixed by seting the user's response to downcase before the conditional clause or during it.
