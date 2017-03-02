sun = ['visible','hidden'].sample

puts "The clouds are blocking the sun!" unless sun == 'visible'
puts "The sun is so bright!" if sun == 'visible'