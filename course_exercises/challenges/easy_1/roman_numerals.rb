class Integer
  ROMAN_THOUSANDS = { 1 => 'M', 2 => 'MM', 3 => 'MMM', }
  ROMAN_HUNDREDS  = { 1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD', 5 => 'D', 
                      6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM'}
  ROMAN_TENS      = { 1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL', 5 => 'L',
                      6 => 'LX', 7=> 'LXX', 8 => 'LXXX', 9 => 'XC' }
  ROMAN_UNITS     = { 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
                      6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX' }
  INDEXED_ROMAN_NUMBERS = { 0 => ROMAN_UNITS, 1 => ROMAN_TENS, 
                            2 => ROMAN_HUNDREDS, 3 => ROMAN_THOUSANDS }


  def to_roman
    number = ''
    digits = self.to_s.chars.map(&:to_i).reverse  #converts to an array.
    digits.each_with_index do |n, i|
      next if n == 0 #kips if the number is a zero
      number.prepend(INDEXED_ROMAN_NUMBERS[i][n]) # prepends converted number to start of the string.
    end
    number
  end
end
