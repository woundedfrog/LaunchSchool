#create an empty array
#Create a loop from 1 upto n - 1
#  if the loop number is even, skip
#  else "*" * n and pass the Centered value into the new array.
#print out the new array
#print out the "*" * n
#print out the new array in reverse

def diamond(n)
first = []
  1.upto(n-1) do |x|
    next if x.even?
    first  << ("*" * (x)).center(n)
  end
puts first
  puts "*" * n
  puts first.reverse
end

diamond(3)

