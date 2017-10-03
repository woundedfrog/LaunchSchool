#Complete this program so that it produces the expected output:

class Book
  attr_reader :title, :author
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
#Expected output:

#The author of "Snow Crash" is Neil Stephenson.
#book = "Snow Crash", by Neil Stephenson.

#FURTHER:
#We use attr_reader here because we only want to retreive the title and author. We don't need to re-assign it.
#We could use attr_accessor, as this gives use the added benefit of being able to re-assign the instance variables, while still giving us read access. HOwever, this gives us write access on our variables, and in this case it is not what we want. Using this might allow unforseen changes later.
#attr_writer would not make the code work.

#if we had:
#  def title
#  @title
#end
#
#def author
#  @author
#end

#it works the same as attr_reader :title, :author
#Writing our methods in this custom way allows use to add other functionality to the getter or setter methods. It allows for greater manipulation when calling either one of those methods.