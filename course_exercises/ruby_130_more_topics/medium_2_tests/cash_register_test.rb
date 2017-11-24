require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(200)
    @transaction = Transaction.new(20)
    @transaction.amount_paid = 20
  end

  def test_accept_money
    new_total = @register.accept_money(@transaction)
    assert_equal(200 + 20, new_total)
  end

  def test_change
    @transaction.amount_paid = 30
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    cost = @transaction.item_cost
    assert_output("You've paid $#{cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
  
  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input_val = StringIO.new('25\n')
    transaction.prompt_for_payment(input: input_val)
    assert_equal(25, transaction.amount_paid)
  end
end