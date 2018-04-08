# Meetup
# Typically meetups happen on the same day of the week.
#
# Examples are
#
# the first Monday
# the third Tuesday
# the Wednesteenth
# the last Thursday
# Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.
#
# Write code that calculates date of meetups.
require 'date'

class Date
  def teenth
    (13..19).to_a.include?(self.day)
  end

  # def first(compared_day)
  #   # self
  #   # day = Time.new(self.year,self.mon,self.day).strftime("%A")
  #
  #   counter = 0
  #   1.upto(31) do |c|
  #     new_date = self.next_day(n=c)
  #     counter += 1 if new_date.day == new_date.compared_day
  #     return true if counter == 1
  #   end
  # end


end

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, placement)
    @date = Date.new(@year, @month, 1)

    total_days.times do |digit|
      return @date if @date.send((day.to_s + "?").to_sym) == true && method_helper(day, placement)
      n = 1
      @date = @date.next_day(n=n)
      n += 1
    end
  end
#i know it's a teen day
# i know it's a monday

  def method_helper(day, placement)
    @day = (day.to_s + "?").to_sym

    case placement
    when :teenth
    return @date.send(placement) == true
    when :first
      return send(placement)
    when :second
      return send(placement) == @date
    when :third
      return send(placement) == @date
    when :fourth
      return send(placement) == @date
    when :last
      return send(placement) == @date
    else
      return "nothing"
    end
  end


  def first

      day_calculator(1)
    # new_date = Date.new(@year,@month,1)
    # counter = 0
    # 31.times do |c|
    #   date = new_date.next_day(n=c)
    #   counter += 1 if date.send(@day)
    #   counter += 1 if what_day?(new_date) == what_day?(@date)
    #   return true if counter == 1
    # end
  end

  def second
    day_calculator(2)
    # new_date = Date.new(@year, @month, 1)
    #
    # counter = 0
    # 31.times do |c|
    #   date = new_date.next_day(n=c)
    #   counter += 1 if date.send(@day)
    #   return date if counter == 2
    # end
  end

  def third

      day_calculator(3)
    # new_date = Date.new(@year, @month, 1)
    #
    # counter = 0
    # 31.times do |c|
    #   date = new_date.next_day(n=c)
    #   counter += 1 if date.send(@day)
    #   return date if counter == 3
    # end
  end

  def fourth
    day_calculator(4)
    # new_date = Date.new(@year, @month, 1)
    #
    # counter = 0
    # 31.times do |c|
    #   date = new_date.next_day(n=c)
    #   counter += 1 if date.send(@day)
    #   return date if counter == 4
    # end
  end

  def last
    new_date = Date.new(@year, @month, total_days)

    counter = 0
    31.times do |c|
      date = new_date.prev_day(n=c)
      counter += 1 if date.send(@day)
      return date if counter == 1
    end
  end

  def day_calculator(nth)
    new_date = Date.new(@year, @month, 1)

    counter = 0
    total_days.times do |c|
      date = new_date.next_day(n=c)
      counter += 1 if date.send(@day)
      return date if counter == nth
    end
  end

  def total_days
    Date.new(@year,@month,-1).day
  end

  def what_day?(new_date)
    Time.new(new_date.year,new_date.mon,new_date.day).strftime("%A")
  end
end


 p Date.new(2013, 2, 2) == Meetup.new(2, 2013).day(:saturday, :first)
