stoplight = ['green','yellow','red'].sample

case stoplight
when 'green' then puts "Go!"
when 'yellow' then puts "Slow down!"
when 'red' then puts "Stop!"
end

  #or

  case stoplight
  when 'green' 
    puts "Go!"
  when 'yellow' 
    puts "Slow down!"
  else 'red' 
    puts "Stop!"
  end
