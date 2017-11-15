require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  def test_class_match
    car = Car.new
    assert_equal(true, car.instance_of?(Car)) #extra test for practice
  end
  
  # test made to fail
  def test_bad_wheels
    skip('Passed for testing')
    car = Car.new
    assert_equal(3, car.wheels)
  end
end