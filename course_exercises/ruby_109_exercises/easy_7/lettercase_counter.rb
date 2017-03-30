def letter_case_count(string)
  count_hash = Hash.new
  count_hash[:lowercase] = string.scan(/[a-z]/).count
  count_hash[:uppercase] = string.scan(/[A-Z]/).count
  count_hash[:neither] = string.scan(/[^a-zA-Z]/).count

  count_hash
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }