munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts munsters

munsters.each do |name, information|
  case information["age"]
  when 0...18
    information["age_group"] = "kid"
  when 18...65
    information["age_group"] = "adult"
  else
    information["age_group"] = "senior"
  end
end

puts munsters