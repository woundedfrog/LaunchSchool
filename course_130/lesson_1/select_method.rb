#custom select method


array = [1, 2, 3, 4, 5]

def select(arr)
  new_array = []
  idx = 0
  while idx < arr.size
    if yield(arr[idx]) == true
      new_array << arr[idx]
    end
    idx += 1
  end
  new_array
end


p select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because 


#or

def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end