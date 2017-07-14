#What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
#The Expand#to_s method tries to call the private #expand method with the syntax self.expand(3). This fails though, since private methods can never be called with an explicit receiver, even when that receiver is self. Thus, #expand must be called as expand(3).