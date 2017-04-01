require 'pry'
def fizzbuzz(start_n,end_n)
  fizzy = (start_n..end_n).map do |num|

    case
    when num % 3 == 0 && num % 5 == 0
      num = 'FizzBuzz'
    when num % 5 == 0
      num = "Buzz"
      #binding.pry
    when num % 3 == 0
      num = "Fizz"
    else
      num
    end

  end
  fizzy
end

#OR:

require 'pry'
def fizzbuzz(start_n,end_n)
  fizzy = start_n.upto(end_n).map do |num|
    if num % 3 == 0 && num % 5 == 0
      num = 'FizzBuzz'
    elsif num % 5 == 0
      num = "Buzz"
      #binding.pry
    elsif num % 3 == 0
      num = "Fizz"
    else
      num
    end

  end
  fizzy
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


