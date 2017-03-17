
puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
percent = gets.chomp.to_f

percent_of_bill = (bill * percent / 100).round(2)
total = (percent_of_bill + bill).round(2)

puts "The tip is $#{percent_of_bill}"
puts "The total is $#{total}"

#FURTHER EXPLORATION: