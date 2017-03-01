#Fibonacci: select from array if INDEX is Fibonacci number
#___________________RECURSION FIBONACCI________________________
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n','o','p','q','r']
#
def is_fib?(index, frst = 0, scnd = 1)
	return true if index == scnd || index == frst
	return false if scnd > index
	is_fib?(index, scnd, scnd + frst)
end

def fib(arr)
arr.select.with_index do |val, index|
 val if is_fib?(index)  #this checks if the index is a fib number
end
end

p fib(arr)
#_________________________OR____________________________

#def is_fib?(index)
#  first = 1
#  second = 1
#  
#  loop do 
#    fib = first + second
#    first = second
#    second = fib
#    
#    return true if index == fib || index == 1
#    break if fib > index
#  end
#  
#  return false
#end
#
#
#def print_fibonacci(array)
#  array.each_with_index do |element,index|
#    p element if is_fib?(index)
#  end
#end
#
#print_fibonacci(arr)

#______________________Fibonacci: Generate fibonacci array______________________

def fibonacci(n) 
  seq   = [0, 1]
  n.times { seq << seq[-1] + seq[-1 - 1] }
  seq
end

a = fibonacci(6) # this sums the 2 previous numbers together 5 times.
p a
#OR
#returns index of fibo number whose digit length == argument number
def fib(num)
  fibo = [1]
  index = 1
  loop do
    fibo << fibo.last(2).inject(:+) 
    break if fibo[index].to_s.length == num
    index += 1   
  end
  index
end
  
p fib(50)
  
  #returns array of fibo numbers up to the nth number
  def fib(num)
  fibo = [1]
  loop do
    fibo << fibo.last(2).inject(:+) 
    break if fibo.length == num
  end
    fibo
end
  
p fib(50)
  
#______________________________Fibonacci____________________________


def fib(n)
  if n < 2
    n
    else
      fib(n-1) + fib(n-2)
  end
end

(0..10).map{|x| p fib(x)} #generates x number of fib numbers according to range.

#________________________________________________________________________
#________________________________________________________________________
#________________________________________________________________________

#REVERSE Array without reverse method
#1 option:
array = [*"a".."z"]
seq = []

array.each_with_index do |v,i|
  seq.unshift(array[i])
end
p seq

# OPTION 2


a = [1,2,3,4,5,65,6,7]
a2 = []
a3 = []
#p a.reverse
#while a != []
#a2 << a.pop
#end
#p a2
a.each do |val|
a3.unshift(val)
end
p a3

#options 3

a = [1,2,3,4,5,65,6,7]
a2 = []
p a.reverse
while a != []
a2 << a.pop
end
p a2

#________________________________________________________________________
#________________________________________________________________________
#________________________________________________________________________

#palindrome without reverse method:

#pALINdromEs



def strings(str, f_num, s_num = nil)
  final = []
  return final << str[f_num] if s_num == nil
  return final << str[f_num..s_num]
end
##p strings('amazinglyawesome', 2, 7)
##p strings('amazinglyawesome', 5)
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
def palin(str)
  pals = substrings(str)
  palindrome = []
  pals.each do |string|
    palindrome << string if string == string.reverse
  end
  palindrome
#  palindrome.chars do |string|
end
#
##p palin('pine')
##p palin('pipepip')
##p palin('ppooppe')
#
def largest_pal(str)
 p largest = palin(str)
  largest.max_by { |x| x.length }
end
#
#p largest_pal("pine")
#p largest_pal("ppoppa")
#p largest_pal("ppop")

#________________________________________________________________________
#________________________________________________________________________
#________________________________________________________________________

#select sub strings 

a = 'this is a string'
def strings(str, f_num, s_num = nil)
  final = []
  return final << str[f_num].delete(" ") if s_num == nil
  return final << str[f_num..s_num]
end

#p strings(a, 2, 4)
#p strings(a, 0, 4)
#p strings(a, 5, 7)
#p strings(a, 2)


def substrings(str)
result = []
  str.chars.each_with_index do |letter, idx|
    position = idx + 1
    (str.size - position).times do |n|
      result << strings(str, idx, idx+n+1)
      end
end
  result
end


p substrings('honey')
p substrings('band')
p substrings('ppop')