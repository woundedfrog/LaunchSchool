class Octal
  def initialize(oct_str)
    @octal = oct_str
  end

  def to_decimal
    value = format_number
  end

  private

  def format_number
    return 0 if invalid_num?(@octal)
    val = 0
    @octal.reverse.each_char.with_index do |char, idx|
      val += char.to_i * (8 ** idx)
    end
    val
  end

  def invalid_num?(num)
    num =~ /\D|[8-9]/ || num.class != String
  end
end

#p Octal.new('233').to_decimal

#OR:

#class Octal
#  def initialize(str)
#    @digits = str.chars
#  end
#
#  def to_decimal
#    return 0 if @digits.any? { |digit| digit =~ /[^0-7]/ }
#    @digits
#      .map(&:to_i)
#      .reverse
#      .each_with_index
#      .map { |digit, index| digit * (8 ** index) }
#      .inject(:+)
#  end
#end