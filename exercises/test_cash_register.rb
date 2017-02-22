require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    cash_register = CashRegister.new(500)
    transaction1 = Transaction.new(200)
    transaction1.amount_paid = 200

    amount_before = cash_register.total_money
    cash_register.accept_money(transaction1)

    assert_equal(amount_before + 200, cash_register.total_money)
  end
end
