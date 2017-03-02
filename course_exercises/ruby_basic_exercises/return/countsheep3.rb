def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

=begin
0
1
2
nil
is printed out.

Just like before the numbers are printed out, but only up to number 2. once a number reaches 2 or higher, the if conditional is executed.
The return on line 5 exits the method and nil is returned because it is not provided with a value.

p on line 10 prints the nil to the screen.
=end