
def star(num)
  star = Array.new(num) { [" "] * num }
  star.each_with_index do |line, index|
    line[index] = "*"
    line[num/2] = "*"
    line[-index-1] = "*"
    line.map! { |ele| ele = "*" } if index == num / 2
  end
  star.each do |line| 
    puts line.join
  end
end

star(7)
