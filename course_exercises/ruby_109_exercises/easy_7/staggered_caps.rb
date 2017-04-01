
#itterate over each character in the string
#if digit is a letter and index == even
  #then to UPPERCASE
#if digit is a letter and index == odd
  #then to DOWNCASE
#if digit is not a letter, then digit

def staggered_case(string)
  string = string.downcase
  new_s = string.chars.map.with_index do |digit, index|
    if index.even?
      digit.upcase
      elsif index.odd?
        digit.downcase
    end
  end
  
  new_s.join("")
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

#FURTHER:

def staggered_case2(string, bool = false)
  string = string.downcase
  new_s = string.chars.map.with_index do |digit, index|
    case bool
      when index.even?
        digit.downcase
      when index.odd?
        digit.upcase
    end
  
end
  new_s.join("")
end


puts staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL_CAPS', true) == 'aLl_cApS'
puts staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'