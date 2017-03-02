def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

=begin
0
1
2
3
4
10 
is printed out.

the #times block prints the sheep(counter) using puts.
'10' is the last line in the method, so its value is implicitly returned, which is 10.
*the return value of #times is still 5, but it's not used.
=end