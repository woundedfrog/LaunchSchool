#rotation part 1:

#In this problem I am given an array of any length. 
#I need to return a new array with the first digit/element moved to the end of the array.
#Everything else needs to stay the same.
#
#Example: [1,2,3,4] => [2,3,4,1]

##Possbile solution:
#Option 1:

#use the slice method on the array to cut the first element away from the rest of the array.
#Return the 2nd half of the array and append the first half to it.
#  

#Solution:
def rotate_array(arr)
  arr = arr[1..-1] + [arr[0]]
end


##Option 2:
#initialize a new variable and assign an empty array.
#iterate through the given array using each_with_index
#  if the index value == 0
#    then skip(next)
#    else
#      append the value to the newly created variable
#    end
#after iteration is done, append elemennt at index zero to the end of the array.
#  
#
#
##Option 3
#create new variable and assign empty array.
#  create a new SIZE variable and assign it to the (array.size)
#call the '#upto(1)' method on the size variable and iterate through the array.
#  if arr[-index] == the arr.size
#    then append the element to end of array.
#  else
#    append the element to new array using arr[index]
#
#This will loop from the 2nd element to the last element and append each element to the new array.
#    When it reaches the last num(last loop) the index value is changed to a negative which will reference the first element in the array.

#"#Rotate part 2:
##In this problem I have to rotate the digit represented by the given number to the end of the number.
##  if the number == 1 then nothing is rotated
##  if the number == 2 then the 2nd last digit is rotated to the end of the number.
##  the number can be anything from 1 to the number.size
#
##I can use the previously created method to solve this.
#
##First I need to create an array from the given number.
#I need to change it to a string and then split it to return an array.
#
#Then I will split the array into two sections again. The first section stay unchanged and it is from index 0 to negative index of given number - so number 3 => -3 which is the 3rd element from the end of the arayy.
##  2) the second half of the array is when I will then pass in as an argument to the previous method that i created when I call it.
#
##    the return value will be the desired array.
#"
def rotate_rightmost_digits(arr,n)
  arr = arr.to_s.split("")
  arr = arr[0...-n] + rotate_array(arr[-n..-1])
  arr.join("").to_i
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

#
#Rotate part 3:
#  This one is similar to rotote part 2, but now the index number changes at each iteration.
#  This changes the rotation position and size.
#  The previous method changes the number to a string then array and does the rotation. So for this mothod I can just use a simple upto loop to get the index value.
#      
#define the method
#  create number.to_s.size.downto(1) loop. it takes one argument to represent the index number
#    then call the previous method and pass in two arguments. - the number and the index number

def max_rotation(number)
  number.to_s.size.downto(1) do |index|
   number = rotate_rightmost_digits(number,index)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped