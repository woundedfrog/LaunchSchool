def letter_percentages(str)
  percent = {}
  str.chars.each do |x|
    percent[:lowercase] = (str.scan(/[a-z]/).count.to_f) / str.length * 100
    percent[:uppercase] = (str.scan(/[A-Z]/).count.to_f) / str.length * 100
    percent[:neither] = (str.scan(/[^a-zA-Z]/).count.to_f) / str.length * 100
  end

  percent
end


puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }