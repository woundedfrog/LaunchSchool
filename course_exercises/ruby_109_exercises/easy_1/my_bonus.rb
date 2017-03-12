def calculate_bonus(number, bool)
  return bonus = number / 2 if bool
  return bonus = 0
end

#or

def calculate_bonus(number, bool)
bool ? (number / 2) : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000