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

puts ""
def longest_paragraph(text)
  paragraphs = File.read(text).split(/\r\n\r\n/)

  longest_paragraph = ""
  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.length }

  longest_paragraph.size
end

puts longest_paragraph("example_pg84_2.txt")

puts ""

def get_longest_word(text)
  words = File.read(text).split(" ").map! { |word| word.gsub(/[.,!?]/, "") }
  longest_word = words.max_by { |word| word.length }

  longest_word
end

puts get_longest_word("example_pg84_2.txt")