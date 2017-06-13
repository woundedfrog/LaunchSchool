#Continuing with our Person class definition, what does the below print out?

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

#output:  The person's name is: #<Person:0x00000001411210>

#If we do not have a to_s method we can use, we must use string concatenation:

puts "The person's name is: " + bob.name        # => The person's name is: Robert Smith