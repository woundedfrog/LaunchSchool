#Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.

#For any digits that thus become 10 or more, subtract 9 from the result.

#  Add all these digits together.

class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    checksums = []
    @number.digits.map.with_index do |digit, idx|
      if idx.odd?
        num = digit * 2
        if num >= 10
          checksums << (num -= 9)
        else
          checksums << num
        end
      else
        checksums << digit
      end
    end
    checksums.reverse!
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum > 9 && checksum % 10 == 0
  end

  def self.create(num)
    Luhn.new(num).number
  end
  
  
  def number
    0.upto(10) do |n|
      new_number = (@number.to_s + "#{n}").to_i
      luhn = Luhn.new(new_number)
      return new_number if luhn.valid?
    end
  end
end