#If we have a class AngryCat how do we create a new instance of this class?
#
#The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

#ANSWER:
#We could create a new instance of this class by doing the following:

AngryCat.new

#We use '.new' after the class, which tells Ruby that the object is a new istance of the class AngryCat.
