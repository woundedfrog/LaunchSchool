require 'pry'
class PigLatin
  def self.translate(str)
    if str.include?(" ")
      return string_to_words(str)
    end
    if str[0] =~ /[aieo]/
      str + 'ay'
    else
      string_rotator(str)
    end
  end

  # refactor this terrible conditional clause
  def self.string_rotator(str)
    15.times do
      if (str[0] == 'u' && str[1] =~ /[aieo]/) ||
         str[0..1] == 'xy' ||
         str[0..1] == 'ay' ||
         (str[0] == 'y' && str[1] =~ /[aiueo]/ || str[1] == 'x') ||
         (str[0] == 'x' && str[1] =~ /[aiueo]/) ||
         str[0..1] == 'ia' ||
         str[0] =~ /[^aieouyx]/
        str = str[1..-1] + str[0]
      else
        return str + 'ay'
      end
      str
    end
  end

  def self.string_to_words(str)
    new_str = []
    str.split(" ").each do |word|
      new_str << translate(word)
    end
    new_str.join(" ")
  end
end

p PigLatin.translate("xray")
# p PigLatin.translate('quick fast run')
