

puts "What's your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement = gets.chomp.to_i

current_time = Time.now.year
work_years_left = retirement - age
retirement_year = current_time + work_years_left

puts "It's #{current_time}. You will retire in #{retirement_year}."
puts "You have to hold on and push through #{work_years_left} years of work. Good luck!"