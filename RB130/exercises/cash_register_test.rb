# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  #We now have the foundation of our CashRegister test class set up. 
  #Let's start testing! We'll start with the CashRegister#accept_money method. 
  #Write a test for the #accept_money method.
  #For this test, make sure that #accept_money properly changes the amount of money returned by #total_money.` 
  #You'll also have to setup the necessary objects to test that this method is working as intended.

  def test_accept_money
    transaction = Transaction.new(10.00)
    register = CashRegister.new(50.00)
    transaction.amount_paid = 15.00

    assert_equal(65.00, register.accept_money(transaction))
  end

  def test_change
    transaction = Transaction.new(10.00)
    register = CashRegister.new(50.00)
    transaction.amount_paid = 15.00

    assert_equal(5.00, register.change(transaction))
  end

  #Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.
  def test_give_reciept
    item_cost = 10.00
    transaction = Transaction.new(item_cost)
    register = CashRegister.new(50.00)
    transaction.amount_paid = 15.00

    assert_output("You've paid $#{item_cost}.\n") { register.give_receipt(transaction) }
  end
end

