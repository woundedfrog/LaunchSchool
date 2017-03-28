def time_of_day(mins)
  hours, minutes = mins.abs.divmod(60)
  hours = hours % 24 if hours >= 24  

  if mins < 0
    minutes = 60 - minutes
    hours = minutes > 0 ? 23 - hours : 24 - hours 
  end

  mm = minutes < 10 ? "0#{minutes}" : minutes 
  hh = hours < 10 ? "0#{hours}" : hours

  "#{hh}:#{mm}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-400) == "17:20"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
