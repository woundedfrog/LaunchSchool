NOUN = %w(movie story book riddle lesson)
ADJ = %w(big small fast young old stupid smart weird)
VERB = %w(hit played sang slept)


File.open('madlibs.txt', 'r') do |f|
  f.each_line do |line|
    line = line.split(" ").map do |word|
      if word.include?("[noun]")
        word.gsub("[noun]", NOUN.sample)
      elsif word.include?("[adj]")
        word.gsub("[adj]", ADJ.sample)
      elsif word.include?("[verb]")
        word.gsub("[verb]", VERB.sample)
      else
        word
      end
    end.join(" ")
    p line
  end
end