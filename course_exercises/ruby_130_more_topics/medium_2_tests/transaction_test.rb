require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  ##def setup
  #  class Transaction
  #    def prompt_for_payment(input: $stdin, output: $stdout)
  #      loop do
  #        output.puts "You owe $#{item_cost}.\nHow much are you paying?"
  #        @amount_paid = input.gets.chomp.to_f
  #        break if valid_payment? && sufficient_payment?
  #        output.puts 'That is not the correct amount. ' \
  #          'Please make sure to pay the full cost.'
  #      end
  #    end
  #  end
  ##end


  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input_val = StringIO.new('25\n')
    output_val = StringIO.new
    transaction.prompt_for_payment(input: input_val, output: output_val)
    assert_equal(25, transaction.amount_paid)
  end
end