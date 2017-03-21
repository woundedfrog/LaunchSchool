puts "Please write word or multiple words:"
string = gets.chomp.delete(" ")

puts "There are #{string.size} characters in \"#{string}\"."