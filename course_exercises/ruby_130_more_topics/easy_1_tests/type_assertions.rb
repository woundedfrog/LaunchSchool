#Type Assertions
#
#Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
#

#This assertion uses Object#.instance_of?()
assert_instance_of(Numeric, value)