require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'transaction'
require_relative 'cash_register'

#Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly.

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal (30, transaction.amount_paid)
  end
end