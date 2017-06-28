#Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?
#
#true
#"hello"
#[1, 2, 3, "happy days"]
#142

#ANSWER:
#They are all 'objects', because everything in Ruby is an object.
#To find out which class of objects they are we can call the #.class method on the object.
#e.g.
  true.class #=> TrueClass
  "hello".class #=> String
  #...