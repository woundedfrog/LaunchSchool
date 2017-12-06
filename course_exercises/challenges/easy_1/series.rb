
class Series
  def initialize(series)
    @series = series
  end

  #def slices(n)
  #  validate_input(n)
  #  
  #  split_series = @series.split("").map(&:to_i)
  #  new_array = []
  #  split_series.each_with_index do |_, idx|
  #    sub_array = []
  #    n.times do |count|
  #      sub_array << split_series[idx+count] if !(split_series[idx + count]).nil?
  #    end
  #    new_array << sub_array if sub_array.size == n
  #  end
  #  new_array
  #end

  #or:
  
  def slices(n)
    validate_input(n)

    split_series = @series.split("").map(&:to_i)
    new_array = []
    @series.size.times do |count|
      sub_array = split_series.drop(count).take(n)
      break if sub_array.size != n
      new_array << sub_array
    end
    new_array
  end

  #Or: 
  #def slices(count)
  # fail ArgumentError.new("Slice is longer than input.") if count > numbers.length
  # numbers.each_cons(count).to_a
  #end

  private

  def validate_input(size)
    fail(ArgumentError, 'too big') if size > @series.size# || @series.size % size != 0
  end
end
