
#palindrome without reverse method:

#pALINdromEs



def strings(str, f_num, s_num = nil)
  final = []
  return final << str[f_num] if s_num == nil
  return final << str[f_num..s_num]
end
#p strings('amazinglyawesome', 2, 7)
#p strings('amazinglyawesome', 5)
#
def substrings(str)
  result = []
  str.chars.each_with_index do |v, i|
    position = i + 1
    (str.size - position).times do |n|
      result << strings(str, i, i+n+1)
    end
  end
  result.flatten
end
#
##p substrings('amazinglyawesome')
#
def rev(str)
  result = []
    str.size.times do |num|
    
    result.unshift(str[num])
    
  end
  result.join("")
end
def palin(str)
  pals = substrings(str)
  palindrome = []
  pals.each do |string|
    palindrome << string if string == rev(string)
#    palindrome << string if string == string.reverse
  end
  palindrome
#  palindrome.chars do |string|
end
#
p palin('pine')
p palin('pipepip')
p palin('ppooppe')
#
def largest_pal(str)
 p largest = palin(str)
  largest.max_by { |x| x.length }
end
#
#p largest_pal("pine")
#p largest_pal("ppoppa")
#p largest_pal("ppop")
