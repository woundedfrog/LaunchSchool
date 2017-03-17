puts "What is your name, sir/madam?"
name = gets.chomp

puts "Hello #{name.capitalize}." if !name.include?("!")
puts "HELLO #{name.upcase.delete("!")}! WHY ARE YOU SCREAMING AT ME?" if name.include?("!")