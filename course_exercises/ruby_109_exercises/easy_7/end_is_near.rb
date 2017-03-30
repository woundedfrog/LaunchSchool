def penultimate(str)
  str.split[-2]

  #OR:
  #str = str.split(" ")
  #str[-2]

end
puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'


#FURTHER:
def middle_word(str)
  middle = ""
  words = str.split

  if words.size.even?
    middle = "Not middle word :/"
  else
    middle = words[words.size / 2] 
  end

  middle
end

puts middle_word('')                        # => 'Not middle word :/'
puts middle_word('The last word')           # => 'last'
puts middle_word('last word')               # => 'Not middle word :/'
puts middle_word('Launch School is great!') # => 'Not middle word :/'
puts middle_word('Launch School is awesomely great!') # => 'is'