def my_method(name = 'Teddy', age)
puts "#{name} is #{age} years old!"
end

age = rand(20..200)
puts "Please enter a name!"
name = gets.chomp.capitalize


my_method(name, age)
my_method(age)