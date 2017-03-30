def word_cap(string)
  #string.split(" ").map! { |x| x.capitalize }.join(" ")
  #OR:
  string.split(" ").map(&:capitalize).join(" ")
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'