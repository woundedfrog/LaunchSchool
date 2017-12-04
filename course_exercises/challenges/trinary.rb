class Trinary
  def initialize(trinary_num)
    @trinary = trinary_num
  end

  def to_decimal
    value = format_number
  end

  private

  def format_number
    return 0 if invalid_num?(@trinary)
    val = 0
    @trinary.reverse.each_char.with_index do |char, idx|
      val += char.to_i * (3 ** idx)
    end
    val
  end

  def invalid_num?(num)
    num =~ /[^0-2]/ || num.class != String
  end
end