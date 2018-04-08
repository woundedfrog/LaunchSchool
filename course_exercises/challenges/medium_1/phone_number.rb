# Phone Number
# Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.
#
# The rules are as follows:
#
# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number
# Test suite:

class PhoneNumber
  def initialize(the_number)
    @the_number = the_number.gsub(/[^a-z0-9]/i, "")
  end

  def number
    the_number = @the_number.gsub(/[^0-9]/, "")
    if the_number.size > 11 || the_number.size < 10 || !(/[a-z]/i =~ @the_number).nil?
      '0000000000'
    elsif the_number.size == 10
      the_number
    elsif the_number.size == 11 && the_number[0] == '1'
      the_number[1..-1]
    else
      '0000000000'
    end
  end

  def area_code
    @the_number[0..2]
  end

  def to_s
    num = @the_number
    num = num[1..-1] if num.size == 11
    area = num[0..2]
    first = num[3..5]
    last = num[6..-1]
    "(#{area}) #{first}-#{last}"
  end
end
