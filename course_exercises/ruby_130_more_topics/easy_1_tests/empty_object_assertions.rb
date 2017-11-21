#Empty Object Assertions
#
#Write a minitest assertion that will fail if the Array list is not empty.
#

#clearer option
assert_empty(list)

#working, but less clear.
assert_equal(true, list.empty?)