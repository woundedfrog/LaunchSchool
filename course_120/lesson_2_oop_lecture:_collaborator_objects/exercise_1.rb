module SubTest
  def is_module?
     "this is a subtest module"
  end
end
module SubTest2
  def is_module?
     "this is also a subtest module"
  end
end

class Test
  include SubTest
  include SubTest2
  attr_reader :var1, :var2, :test_var
  def initialize
    @var1 = 'hi'
    @var2 = 100
    @test_var = "This is a test variable"
  end
end

timmy = Test.new

puts timmy.var1
puts timmy.var2
puts timmy.test_var
puts timmy.is_module?
puts Test.ancestors