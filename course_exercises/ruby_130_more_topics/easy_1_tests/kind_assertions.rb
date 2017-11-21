#Give us your feedback
#Kind Assertions
#
#Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

assert_kind_of(Numeric, value)
#or:
assert_includes([Fixnum, Numeric, Integer, Float], value.class)