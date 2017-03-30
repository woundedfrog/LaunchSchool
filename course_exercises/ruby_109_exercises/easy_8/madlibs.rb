puts ">> Enter a noun:" 
noun = gets.chomp
puts ">> Enter a verb:" 
verb = gets.chomp
puts ">> Enter an adjective:" 
adjective = gets.chomp
puts ">> Enter an adverb:" 
adverb = gets.chomp

puts ">> Is your 'noun' alive? (y/n)"
alive = gets.chomp.downcase == 'y' ? true : false

if alive
puts "The #{noun} #{verb} #{adverb} on a #{adjective} barnacle!"
else
puts "Does your #{adjective} #{noun} #{verb} you #{adverb}? That's hilarious!"
end
