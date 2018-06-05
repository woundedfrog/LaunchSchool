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


class Meetup

  def initialize(month, year)
    @month = month
    @year = year
    @date = Date.new(@year, @month, 1)
  end

  def day(weekday, schedule)
    @weekday = (weekday.to_s + "?").to_sym

    total_days.times do
      return @date if @date.send(@weekday) == true && method_helper(schedule)
      counter = 1
      @date = @date.next_day(n=counter)
      counter += 1
    end
  end

  def method_helper(schedule)
    case schedule
    when :teenth
      (13..19).to_a.include?(@date.day)
    when :first
      day_calculator(1)
    when :second
      day_calculator(2) == @date
    when :third
      day_calculator(3) == @date
    when :fourth
      day_calculator(4) == @date
    when :last
      last == @date
    end
  end

  def last
    new_date = Date.new(@year, @month, total_days)
    counter = 0

    total_days.times do |c|
      date = new_date.prev_day(n=c)
      counter += 1 if date.send(@weekday)
      return date if counter == 1
    end
  end

  def day_calculator(nth)
    new_date = Date.new(@year, @month, 1)

    counter = 0
    total_days.times do |c|
      date = new_date.next_day(n=c)
      counter += 1 if date.send(@weekday)
      return date if counter == nth
    end
  end

  def total_days
    Date.new(@year, @month, -1).day
  end
end
