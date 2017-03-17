array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?("C", "S") }
puts array2

#prints out:

#Moe
#Larry
#CURLY
#SHEMP
#Harpo
#CHICO
#Groucho
#Zeppo

#Because the code on line 3 copies the references from array 1 to array 2. This is why the content in both were modified. They referenced the same objects.