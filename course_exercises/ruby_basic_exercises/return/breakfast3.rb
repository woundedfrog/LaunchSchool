def meal
  return "Breakfast"
  "dinner"
end

puts meal


#"Breakfast" is printed out because it's being specifically returned by the 'return'.
#When return is used the method is immediately exited and the return value is returned.
#So 'dinner' is never processed, eventhough it's the last line..