def balanced?(str)
  counter = 0
  str.chars.each do |char|
    counter -= 1 if char == ")"
    counter += 1 if char == "("
    return false if counter < 0
  end
  counter == 0
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false