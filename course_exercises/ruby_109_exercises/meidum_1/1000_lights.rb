def light_switch(num)
  lights = {}
  (1..num).each { |num| lights[num] = true }
  (2..num).each do |round|
    light_to_toggle = round
    while light_to_toggle <= num
      lights[light_to_toggle] = !lights[light_to_toggle]
      light_to_toggle += round
    end
  end
  lights
end

puts light_switch(100)