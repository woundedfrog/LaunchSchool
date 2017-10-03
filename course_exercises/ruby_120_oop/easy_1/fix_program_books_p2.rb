class Book
  attr_accessor :title, :author
#  def author=(name)
#    @author = name
#  end
#  
#  def title=(name)
#    @title = name
#  end
#  
#  def author
#    @author
#  end
#  
#  def title
#    @title
#  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

#Expected output:
#
#The author of "Snow Crash" is Neil Stephenson.
#book = "Snow Crash", by Neil Stephenson.

#FURTHER:
#Allowing modification from outside of the class through the setter method could potentially create problems later. We could accidentally modify a variable later without intention.
#It does give more flexibility, but has the added risks.
#Using an initialize method is much more advantagious. It should be used if an object has any states, as in this case: each book has a title and an author.