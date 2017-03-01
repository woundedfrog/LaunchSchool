p arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n','o','p','q','r']

def is_fib?(index, y = 0, x = 1)
	return true if index == x || index == y
	return false if x > index
	is_fib?(index, x, x + y)
end

arr2 =[]
arr.select.with_index do |val, index|
 arr2 << val if is_fib?(index)
end

p arr2

def fib(num)
  first, last = [1,1]
  2.upto(num) do |n|
    first, last = [last,first + last]
  end
  last
end


p fib(10)


def fib(num)
  seq =  [0,1]
  2.upto(num) do |n|
    seq << seq[-1] + seq[-2]
  end
  seq
end

#def fib(n)
#  seq = []
#  n1 = 0
#  n2 = 1
#  while n1 <= n
#    seq << n1
#    n1,n2=n2,n1+n2
#  end
#  seq
#end
#
#arr2 = fib(500)
#p arr2

#counter = 0
#loop do
#arr3 = arr[arr2[counter]]
#  counter += 1
#  break if counter > arr.size
#p arr3
#end
#

#
#def fib(n)
#  n.times.each_with_object([0,1]) { |num, obj| obj << obj[-2] + obj[-1] }
#end
#p fib(10)


#def fibo(n)
#  n < 2 ? n : fibo(n-1) + fibo(n-2)
#end
#p (0..10).map{|x| fibo(x)}

#def fib(n)
#  if n < 2
#    n
#    else
#      fib(n-1) + fib(n-2)
#  end
#end
#
#(0..10).map{|x| fib(x)}

#counter = 0
#while true
#  p arr[arr2[counter]]
#  counter += 1
#  false if arr[arr2[counter]] == nil
#
#end