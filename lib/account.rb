require 'money'
require_relative 'transaction'
require_relative 'statement'
require_relative 'printer'
Money.use_i18n = false

class Account
  attr_reader :balance, :statement
  def initialize(statement = Statement.new, printer_class = Printer)
    @balance = Money.new(0)
    @statement = statement
    @printer_class = printer_class
  end

  def deposit(amount)
    deposit_amount = money(amount)
    @balance += deposit_amount
    @statement.add_transaction(:deposit, @balance, deposit_amount)
    return @balance
  end

  def withdraw(amount)
    withdrawal_amount = money(amount)
    @balance -= withdrawal_amount
    @statement.add_transaction(:withdrawal, @balance, withdrawal_amount)
    return @balance
  end

  def print_statement
    @printer_class.print_statement(@statement)
  end

  private

  # converts amount in float or integer into Money object
  def money(amount)
    Money.new((amount * 100).to_i)
  end

end
