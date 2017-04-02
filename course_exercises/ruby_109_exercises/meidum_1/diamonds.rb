def diamond(size)
  diamond = Array.new
  # upper part
  1.upto(size) { |index| diamond << "*" * index if index.odd? }
  # lower part
  diamond[0..-2].reverse.each { |line| diamond << line }
  # display array centering lines
  diamond.each { |line| puts line.center(size) }
end

diamond(3)
diamond(4)

