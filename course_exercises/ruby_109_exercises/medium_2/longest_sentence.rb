def longest_sentence(text)
  temp = []
  longest = ""
  text = File.read(text)
  text.chars.each do |char|
    temp << char
    if char =~ /[?.!]/
      if temp.join("").size > longest.size
        longest = temp.join("")
        temp = []
      end
      temp = []
    end
  end
  puts "The longest sentence has #{longest.split(" ").size} words."
  puts  longest
end

longest_sentence("example_pg84.txt")
