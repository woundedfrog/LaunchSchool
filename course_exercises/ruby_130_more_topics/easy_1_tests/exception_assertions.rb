#Exception Assertions
#
#Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

assert_raises(NoExperienceError, employee.hire)
#or:
assert_raises NoExperienceError do
  employee.hire
end