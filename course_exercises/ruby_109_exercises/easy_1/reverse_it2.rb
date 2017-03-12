def reverse(word)
  word.reverse
end

def reverse_words(str)
  reversed = str.split(" ").map do |word|
    if word.length >= 5
      reverse(word)
    else
       word 
    end
  end
  reversed.join(" ")

end

puts reverse_words("Professional")
puts reverse_words("Walk around the block")
puts reverse_words("Launch School")