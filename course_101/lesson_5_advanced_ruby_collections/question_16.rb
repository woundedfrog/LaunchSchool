#A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.
#
#It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.
#
#Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
#
#It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
#Write a method that returns one UUID when called with no parameters.

LETTER = %w(a b c d e f 1 2 4 5 6 7 8 9 0)
PARTS = [8,4,4,4,12]

def uuid1
  characters = []

  32.times do |x|
    characters << LETTER.sample
  end

  uuid = []

  PARTS.each do |part|
    uuid <<  characters.pop(part)
  end
  uuid.map { |x| x.join("")}.join("-")
end

p uuid1
#OR:

#def uuid2
#  characters = []
#  32.times do |x|
#    characters << LETTER.sample
#  end
#
#  uuid = ''
#  PARTS.each_with_index do |part,idx|
#    uuid <<  characters.pop(part).join("")
#    uuid << "-" unless idx == 4
#  end
#  
#  uuid
#end
#
#p uuid2

#OR:

#def uuid3
#  characters = []
#  32.times do |x|
#    characters << LETTER.sample
#  end
#
#  uuid = ''
#  PARTS.size.times do |x|
#    uuid <<  characters.pop(PARTS[x]).join("")
#    uuid << "-" unless x == 4
#  end
#  
#  uuid
#end
#
#p uuid3