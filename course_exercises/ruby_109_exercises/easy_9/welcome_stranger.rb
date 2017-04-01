def greetings(name, work)
  "Hello, #{name.join(" ")}! Nice to have a #{work[:title]} #{work[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."