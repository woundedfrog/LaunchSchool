class SecretHandshake
  SIGNS = {4 => 'jump', 3 => 'close your eyes', 2 => 'double blink', 1 => 'wink'}

  def initialize(num)
    @binary = num.is_a?(String) ? num : num.to_s(2)
    @shake = []
  end
  
  def commands
    modder = 1
    signs = []
    number = @binary
    1.upto(@binary.size) do |idx|
        signs.reverse! if idx == 5
      if @binary[-idx] == '1' && idx != 5
        signs << (SIGNS[idx.to_i])
      end
    end
    signs
  end
  
  def reverse
    @shake.reverse.compact
  end
end