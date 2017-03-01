require 'pry' 
NUMS = {
  'zero'=> 0,
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
  }


def computer(string)

  NUMS.each do |k,v|
    string.gsub!(k, v.to_s)
  end
  words = string.split(" ")
  words.delete("by")
  
  loop do
    break unless  words.include?('divided') ||
                  words.include?('times')
index = 0
    words.each_with_index do |el,i|
    if el == 'times' 
      index = i 
      break
      elsif el == 'divided'
      index = i
      break
    end
    end

    first = words[index-1].to_i
    second = words[index+1].to_i
    operator = words[index]
    
    result = case operator
    when 'divided'
      first / second
    when 'times'
      first * second
    end

    words.delete_at(index-1)
    words.delete_at(index-1)    
    words.delete_at(index-1)
    words.insert(index-1,result)
  end

  loop do
    break unless words.include?('plus') ||
      words.include?('minus')

    index = words.index("plus") || index = words.index("minus") #if !words.include?("plus") 
    first = words[index-1].to_i
    second = words[index+1].to_i
    operator = words[index]

    result = case operator
    when 'plus'
      first + second
    when 'minus'
      first - second
    end

    words.delete_at(index-1)
    words.delete_at(index-1)    
    words.delete_at(index-1)
    words.insert(index-1,result)
  end #loop end

  return words.join("").to_i
end

  p computer("two plus one")
p computer("one plus three minus two times four divided by one")
p computer("one plus three minus two times four divided by one times two plus nine")
p computer("one minus 10 plus 11 times six minus five divided by one times 100")
p computer("one minus 10 plus eleven times six minus five divided by one times 1")
p computer("one plus three minus zero")



