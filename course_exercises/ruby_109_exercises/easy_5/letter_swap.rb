def swap(string)
  words = string.split(' ')

  new_a = words.map do |word|
    if word.size < 2 
      word
    else
      word = word[-1] + word[1..-2] + word[0]
    end
  end

  new_a.join(" ")
end

#OR:

def swap(string)
  words = string.split(' ')
  words.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end

  words.join(" ")
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'