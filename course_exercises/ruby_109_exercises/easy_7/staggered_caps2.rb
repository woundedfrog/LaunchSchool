#create variable = 0
#itterate over each character in the string
#if digit is a letter and variable == 0
  #then to UPPERCASE
#if digit is a letter and variable == 1
  #then to DOWNCASE
#if digit is neither, then digit

def staggered_case(string)
  string = string.downcase
  counter = 0
  new_s = []
  string.chars.each do |digit|
    if counter == 0 && (97..122).include?(digit.ord)
      new_s <<  digit.upcase
      counter += 1
    elsif counter == 1 && (97..122).include?(digit.ord)
      new_s << digit.downcase
      counter -= 1
    else
      new_s << digit
    end
  end

  p new_s.join("")
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'