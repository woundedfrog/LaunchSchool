def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts trickey_number

=begin
1
is printed out.

the 'else' part never gets processed because the 'if true' part will always get executed.
puts prints the returned value to the screen, which is 1.
It's a useless variable assignment, but variable always return their assigned values.
=end