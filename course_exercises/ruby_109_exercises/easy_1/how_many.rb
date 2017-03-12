vehicles = ['car','car','truck','car','SUV','truck','motorcycle','motorcycle','car','truck']

def count_occurrences(array)
  occur = {}
  array.uniq.each do |v|
    occur[v] = array.count(v)
  end
  occur.each do |element, count|
    puts "#{element} => #{count}"
end
end

count_occurrences(vehicles)