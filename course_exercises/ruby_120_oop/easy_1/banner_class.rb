#Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.
#
#    You may assume that the input will always fit in your terminal window.


class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * (@message.size)}-+"
  end

  def empty_line
    "| #{' ' * (@message.size)} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

#FURTHER

#class Banner
#  def initialize(message, banner_width = nil)
#    @message = message
#    @banner_width = banner_width ? banner_width : [80, @message.size + 4].min
#  end
#
#  def to_s
#    [horizontal_rule, empty_line, *message_line, empty_line, horizontal_rule].join("\n")
#  end
#
#  private
#
#  def horizontal_rule
#    "+-#{'-' * message_width}-+"
#  end
#
#  def empty_line
#    "| #{' ' * message_width} |"
#  end
#
#  def message_line
#    slice_into_lines.map { |line| "| #{line.center(message_width)} |" }
#  end
#
#  def message_width
#    @banner_width - 4
#  end
#
#  def slice_into_lines
#    lines = @message.gsub(/(.{0,#{message_width}})(\s|\Z)/, "\\1\n")
#    lines.split("\n")
#  end
#end
#
#long_text = "This example demonstrates a block quote. Because some introductory phrases will lead naturally into the block quote, you might choose to begin the block quote with a lowercase letter. In this and the later examples we use “Lorem ipsum” text to ensure that each block quotation contains 40 words or more. Lorem ipsum dolor sit amet, consectetur adipiscing elit. (Organa, 2013, p. 234)\nModify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box."
#banner = Banner.new(long_text, 60)
#puts banner
#banner = Banner.new('To boldly go where no one has gone before.')
#puts banner
#banner = Banner.new('To boldly go where no one has gone before.', 20)
#puts banner
#banner = Banner.new('')
#puts banner