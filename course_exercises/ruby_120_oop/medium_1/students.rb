#Students
#
#Below we have 3 classes: Student, Graduate, and Undergraduate. Some details for these classes are missing. Make changes to the classes below so that the following requirements are fulfilled:
#
#Graduate students have the option to use on-campus parking, while Undergraduate students do not.
#
#Graduate and Undergraduate students have a name and year associated with them.
#
#Note, you can do this by adding or altering no more than 5 lines of code.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name,year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

#Further:
#There is one other "form" of the keyword super. We can call it as super(). This calls the superclass method of the same name as the calling method, but here no arguments are passed to the superclass method at all.
#
#Can you think of a way to use super() in another Student related class?

class Student
  def initialize(name = "Unknown", year = "N/A")
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name,year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end
class PlaceHolder < Student
  def initialize
    super()
  end
end

placeholder1 = PlaceHolder.new