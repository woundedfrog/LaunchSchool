class DNA
  def initialize(strand)
    @strand_one = strand
  end
  
  def hamming_distance(strand2)
    measure(strand2)
  end
  
  def measure(strand_two)
    num = 0
    @strand_one.chars.each_with_index do |base_val, index|
      num += 1 if base_val != strand_two[index] unless strand_two[index].nil?
    end
    num
  end
end

#OR: LS solution
#I realy like the use of #.zip here.

#class DNA
#  def initialize(strand)
#    @strand = strand
#  end
#
#  def hamming_distance(strand_2)
#    strand_1 = @strand[0, strand_2.length]
#
#    strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
#  end
#end