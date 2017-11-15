def each(array)
  index = 0

  while index < array.size
    yield(array[index])                           # yield to the block, passing in the current element to the block
    index += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

each([1,2,3]) do |element|
  p element
end