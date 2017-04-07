BLOCKS = [["B", "O"], ["X", "K"],
  ["D", "Q"], ["C", "P"], ["N", "A"],
  ["G", "T"], ["R", "E"], ["F", "S"],
  ["J", "W"], ["H", "U"], ["V", "I"],
  ["L", "Y"], ["Z", "M"]].freeze

def block_word?(word)
  used_chars = []

  word.chars.each do |char|
    return false if used_chars.include?(char)
    BLOCKS.each do |elem|
      used_chars << elem[0] << elem[1] if elem.include?(char)
    end
  end

  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false