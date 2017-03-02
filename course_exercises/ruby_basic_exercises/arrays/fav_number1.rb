#original
[['Dave',7],['Miranda',3],['Jason',11]]


#Automated

arr = ['Dave',7,'Miranda',3,'Jason',11]

def nested(arr)
  nested_arr = []

  while !arr.empty?
    nested_arr << arr.take(2)
    arr.shift(2)
  end

  nested_arr
end

p nested(arr)