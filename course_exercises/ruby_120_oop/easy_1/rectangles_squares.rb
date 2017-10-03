class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end
#Write a class called Square that inherits from Rectangle, and is used like this:

class Square < Rectangle
  def initialize(length_size)
    super(length_size, length_size)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"