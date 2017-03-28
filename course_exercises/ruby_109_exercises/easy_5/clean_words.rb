def cleanup(string)
  new_s = string.gsub(/[^a-z]/i," ")
  new_s.gsub(/\s+/, " ")
end

#OR:

def cleanup(string)
  string.gsub(/\W/, " ").squeeze(" ")
end


puts cleanup("---what's my +*& line?") == ' what s my line '
puts cleanup("---whDSFEF   ds )(*e?") == ' whDSFEF ds e '