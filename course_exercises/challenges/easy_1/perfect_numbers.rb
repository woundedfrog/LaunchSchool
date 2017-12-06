class PerfectNumber  
  def self.classify(input_num)
    raise RuntimeError if input_num < 0

    sum = self.factorials(input_num).inject(:+)

    case 
      when sum == input_num
        "perfect"
      when sum > input_num
        "abundant"
      else
        "deficient"
    end
  end

  private

  def self.factorials(num)
    (1..num-1).select { |n| num % n == 0 }
  end
end