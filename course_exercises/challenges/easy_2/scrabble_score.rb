class Scrabble
  LETTER_VALUES = {
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
  }
  
  def initialize(str)
    @str = str
  end
  
  def self.score(word)
    self.new(word).score
  end
  
  def score
    number = 0
    string = @str.to_s.upcase.gsub(/[^A-Z]/, '')
    return 0 if @str.nil? || string.empty?
    
    string.chars.map { |let| letter_converter(let) }.inject(:+)
  end
  
  private
  
  def letter_converter(letter)
    LETTER_VALUES.each do |value, array|
      return value if array.include?(letter.upcase)
    end
  end
end

#p Scrabble.new('a').score
#p Scrabble.new(" \t\n").score
#p Scrabble.new('quirky').score
