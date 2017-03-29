def print_in_box(string)
  length = string.size + 2
  p length
  corner = "+"
  horizon = "-"
  vertical = "|"
  puts "#{corner}" + "#{horizon * length}" + "#{corner}"
  puts "#{vertical}" + "#{" " * length}" + "#{vertical}"
  puts "#{vertical}" + " #{string} " + "#{vertical}"
  puts "#{vertical}" + "#{" " * length}" + "#{vertical}"
  puts "#{corner}" + "#{horizon * length}" + "#{corner}"
end


#OR:

def print_in_box(string)
  length = string.size
  puts "+-#{'-' * length}-+"
  puts "| #{' ' * length} |"
  puts "| #{string} |"
  puts "| #{' ' * length} |"
  puts "+-#{'-' * length}-+"
end

puts print_in_box('To boldly go where no one has gone before.')

#OR:

def print_in_box(string)
  length = string.size
  if length > 76
    length = 76
    string = string[0..75]
    
    puts "+-#{'-' * length}-+"
    puts "| #{' ' * length} |"
    puts "| #{string} |"
    puts "| #{' ' * length} |"
    puts "+-#{'-' * length}-+"
  end

end

puts print_in_box('To boldly go where no one has gone before. This is a truncated string to fit the default size of the terminal window.')