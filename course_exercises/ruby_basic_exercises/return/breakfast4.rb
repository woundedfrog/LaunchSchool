def meal
    puts "Dinner"
    return "Breakfast"
end

puts meal


#Answer:
#"Dinner"
#"Breakfast"

#This is because dinner is being printed by the puts method - puts is printing the value, but it's return value is 'nil'

#The last line is being specifically returned which is why "breakfast" printed out as well - Since there are two 'puts''.