require 'pry'

class Cipher

  CIPHER = ('a'..'z').to_a
  attr_accessor :key

  def initialize(key = nil)
    @key =  key.nil? ? (1..100).to_a.map { |_| CIPHER.sample }.join : key
    raise(ArgumentError) if key == '' || /[A-Z]|\d/.match(key)
    # @text =
  end

  def encode(input)
    position = 0
    new_cipher = []

    input.size.times do |idx|

      position = CIPHER.index(input[idx])
      key_position = CIPHER.index(@key[idx])
      changed_value = verify_position(position + key_position)

      new_cipher << CIPHER[changed_value]

    end
    new_cipher.join
  end

  def decode(input)
    position = 0
    new_cipher = []

    input.size.times do |idx|

      position = CIPHER.index(input[idx])
      key_position = CIPHER.index(@key[idx])
          # binding.pry
      changed_value = verify_position(position - key_position)

      new_cipher << CIPHER[changed_value]

    end
    new_cipher.join
  end

  def verify_position(new_position)
    if new_position > CIPHER.size
      new_position -= CIPHER.size
    end
    new_position
  end

end
