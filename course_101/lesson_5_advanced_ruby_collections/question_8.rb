#Using the each method, write some code to output all of the vowels from the strings.


hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


hsh.values.each do |val|
  val.each do |str|
    puts str.scan(/[aeiou]/)
  end
end