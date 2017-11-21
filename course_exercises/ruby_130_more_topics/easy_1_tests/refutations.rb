#Refutations
#
#Write a unit test that will fail if 'xyz' is one of the elements in the Array list:
#

refute_includes(list, 'xyz')
#or:
refute_equal(false, list.include?('xyz'))