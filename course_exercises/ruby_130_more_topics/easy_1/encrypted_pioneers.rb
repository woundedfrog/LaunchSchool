=begin
Encrypted Pioneers

The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names .

=end

CYPHER = { 'A' => 'N', 'B' => 'O', 'C' => 'P', 'D' => 'Q',
           'E' => 'R', 'F' => 'S', 'G' => 'T', 'H' => 'U',
           'I' => 'V', 'J'=> 'W', 'K' => 'X', 'L' => 'Y', 'M' => 'Z' }


def rot13(name)
  new_name = []
  name.chars.map do |letter|
    letter.upcase!
      new_name << letter if letter == " "
    if CYPHER.keys.include?(letter)
      new_name << CYPHER[letter]
    else
      CYPHER.each do |k,v| 
        new_name << k if v == letter
      end
    end
  end
  new_name = new_name.join("").split(" ")
  new_name.map(&:capitalize).join(" ")
end

#OR:

#def rot13(name)
#  name.chars.map do |letter|
#    if ('A'..'M').include?(letter) || ('a'..'m').include?(letter)
#      (letter.ord + 13).chr
#    elsif ('N'..'Z').include?(letter) || ('n'..'z').include?(letter)
#      (letter.ord - 13).chr
#    else
#      " "
#    end
#  end.join("")
#end

File.open("name.txt", "r").each_line do |line|
  puts rot13(line)
end