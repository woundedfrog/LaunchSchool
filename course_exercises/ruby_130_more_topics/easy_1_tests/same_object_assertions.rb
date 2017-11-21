#Same Object Assertions
#
#Write a unit test that will fail if list and the return value of list.process are different objects.
#

assert_same(list, list.process)