
def double_consonants(string)
  result = ""

string.chars.map do |let|
    if let =~ /\w/ && let =~ /[^aiueo0-9]/
      let * 2
    else
      let
    end
  end.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""