def triangle(num)
  star = "*"
  1.upto(num) do |x|
    puts "#{' ' * (num - x)}#{star * x}"
  end
end

triangle(5)
triangle(9)