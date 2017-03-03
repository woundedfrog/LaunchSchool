numbers = {
  hight: 100,
  medium: 50,
  low:    10
  }

low_numbers = numbers.select! do |k,v|
  v < 25
end

p low_numbers
p numbers

#further exploration
#Not it is not necessary to assign the 'low_numbers' variable.