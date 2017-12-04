
class Anagram
  def initialize(word)
    @word = word.downcase
  end
  
  def match(list)
    list.select { |match| letter_sorter(match) == letter_sorter(@word) && match.downcase != @word }
  end
  
  def letter_sorter(word)
      word.downcase.chars.sort.join("")
  end
end
