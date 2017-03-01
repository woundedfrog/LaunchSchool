require 'date'
  string = "This is my string that I use for testing."
  array = ('a'..'z').to_a
  arr = ['Athis is a string','this is a bloop']
  hsh = {test: 'test',tost: 'toast',taust: 'taust'}

TS = [
 ihash: { one: { name: "Thinkpad x210", price: 220 },  two: { name: "Thinkpad x220", price: 250 },  three: { name: "Thinkpad x250", price: 979 }}
  ]
  
  res = []
  TS.each do |hsh|
    hsh.each do |k,v|
      v.each do |keys,val|
        p val[:price]
      res << val[:name] if val[:name].include?('220')
    end
    end
    p res
  end

  hashi = {three: 'ooh', four: 'ahh'}
  hashi2 = {one: 'this', two: 'that'}
  
  hashi["three"] = 'this&that'
  p hashi["three"] = 'toodoo'
  p hashi.keys.class.name
  p hashi.key?('three')
  p hashi.values
  p hashi2.merge(hashi)
  p hashi

 def friday_13?(year)
   fri = 0
   (1..12).each do |month|
     fri += 1 if Date.new(year,month,13).friday?
   end
   fri
 end
  
p  friday_13?(2015)
p  friday_13?(2016)
p  friday_13?(2017)
