#There are 1000 lights. Initially they are all off.
#  In the first round each light is turned on.
#  in the second round every 2nd element element switch is reversed(on=>off / off =>on)
#  In the third round every 3rd element is reversed.
#  ...
#  
#first define method
#Create an empty hash.
#  create a loop upto the number
#    in each loop assign the number as the key and the value false.
#    
#
#  Create a times loop from 1 to 1000
#    inside the loop iterate through the hash - keep track of the index values.
#        if the iteration index % loop index == 0
#          reassign the value to opposite of current
#        else 
#          nothing
#return keys of all lights that are ON
#          

def light_s(n)
  hsh = {}
  n.times do |x|
    hsh[x] = false
  end
  1.upto(n) do |x|
    hsh.each do |k,v|
      hsh[k] = !v if k % x == 0
    end
  end
  hsh.select {|light,bool| bool == true }.keys
end

p light_s(10)