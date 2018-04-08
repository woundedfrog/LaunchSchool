# Clock
# Create a clock that is independent of date.
#
# You should be able to add and subtract minutes to it. Two clocks that represent the same time should be equal to each other.

class Clock
  MAX = 60
  def initialize(h,m)
    h = h * 60
    m = m
    m = h+m
    @hours, @minutes = m.divmod(60)
  end

  def self.at(h, m = 0)
    Clock.new(h, m)
  end

  def +(mins)
    m = @minutes + mins
    while m >= 60
      @hours += 1
      m -= 60
    end
    @hours %= 24
    @minutes = m

    self.class.at(@hours,@minutes)
  end

  def -(mins)
    mins = (@hours * 60) + @minutes - mins
    h, m = mins.divmod(60)
    h = h % 24

    self.class.at(h,m)
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  def to_s
    h = @hours.to_s.size < 2 ? '0' + @hours.to_s : @hours
    m = @minutes.to_s.size < 2 ? '0' + @minutes.to_s : @minutes
    "#{h}:#{m}"
  end

end
