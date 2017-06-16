#class Integer
#  def digit_split
#    self.to_s.split("").map(&:to_i)
#  end
#end
#
#puts 555.class
#p 555.digit_split

#n Place a value n in the "register". Do not modify the stack.
#PUSH Push the register value on to the stack. Leave the value in the register.
#ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
#SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
#MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
#DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#POP Remove the topmost item from the stack and place in register
#PRINT Print the register value

#stack machines.

#iterate over each word/digit and call the element on the instantiated object.
#  e.g.

class Minilang

  attr_accessor :token, :register, :stack, :string

  def initialize(string)
    @string = string
    @token = nil
    @register = 0
    @stack = []
  end

  def eval  #when this method is called, it iterates over each word, calling the respective methods.
    string.split(" ").each do |element|
      @token = element  #assigning the token
      case element
      when "PRINT"
        to_s()  #has to print out the register
      when "PUSH"
        push_num()       
      when "ADD"
        addition()
      when "SUB"
        subtract()
      when "MULT"
        multiply()
      when "POP"
        pop_from_stack()
      when "MOD"
        mod_value()
      when "DIV"
        divide()
      else
        if element.to_i.to_s == element
          n(@token) #assigns to register
        else
          puts "Invalid token #{element}"
          return
        end
      end
    end
  end

  def n(num)
    @register = num.to_i
  end

  def push_num
    @stack << @register 
  end

  def multiply
    @register *= @stack.pop
  end

  def subtract
    @register -= @stack.pop  
  end

  def pop_from_stack
    @register = @stack.pop
    if @register.nil?
     @register = error_report(@register)
    end
  end

  def mod_value
    @register %= @stack.pop
  end

  def divide
    @register /= @stack.pop
  end

  def addition
    @register += @stack.pop
  end

  def error_report(error_token)
    "Empty stack!"
  end

  def to_s
    puts @register.nil? ? 'The value is 0' : "The value is #{@register}"   #needs to pring to_s
  end
end

#Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT')#.eval
#string = '5 PRINT PUSH 3 PRINT ADD PRINT'
#string = '5 PRINT PUSH 3 PRINT ADD PRINT PUSH 5 SUB PRINT PUSH 2 MULT PRINT 5 PUSH 3 MOD PRINT'
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
