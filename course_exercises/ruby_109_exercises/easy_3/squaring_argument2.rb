def multiply(a,b)
  a * b
end

def power(base, exp)
  result = 1
  exp.times { result = multiply(result, base) }
  result
end

puts power(2, 3) # => 8
puts power(5, 2) # => 25
puts power(3, 3) # => 27