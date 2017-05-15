#Given this nested Hash:
#figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_age = 0

munsters.each_value.each do |nested_h|
  male_age += nested_h['age'] if nested_h['gender'] == 'male'
end

#OR:
#munsters.values.each do |nested_h|
#  male_age += nested_h['age'] if nested_h['gender'] == 'male'
#end

male_age

