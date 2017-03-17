METER_TO_FEET = 10.7639

puts "Please enter a width of the room!"
width = gets.chomp.to_f
puts "Please enter a length of the room!"
length = gets.chomp.to_f

sqr_meters = (length * width).round(2)
  sqr_feet = (sqr_meters * METER_TO_FEET).round(2)

puts "The area of the room is #{sqr_meters} square meters (#{sqr_feet} square feet)."


#FURTHER EXPLORATION:
