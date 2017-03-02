def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

=begin
0
1
2
3
4
5
is print out. 

#times also starts at 0, so 0 to 4 is printed out.

#times always returns the initial digit, which is '5'. 
So since it's also the last(only) block of code in the method, it's return value, which is 5, is returned.
=end