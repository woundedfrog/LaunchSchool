class Phrase
  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count
    @phrase.scan(/\b[\w']+\b/)
           .each_with_object(Hash.new(0)) do |word, obj|
              obj[word.downcase] += 1
  end
  end
end
