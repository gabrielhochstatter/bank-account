require 'money'
require 'terminal-table'
require_relative 'transaction'
require_relative 'statement'
Money.use_i18n = false

class Account
  attr_reader :balance, :statement, :statement_table_array

  def initialize
    @balance = Money.new(0)
    @statement = Statement.new
  end

  def deposit(amount)
    deposit_amount = money(amount)
    @balance += deposit_amount
    @statement.add_transaction(:deposit, @balance, deposit_amount)
    puts "#{deposit_amount} deposited! Your balance is now: $#{@balance}"
  end

  def withdraw(amount)
    withdrawal_amount = money(amount)
    @balance -= withdrawal_amount
    @statement.add_transaction(:withdrawal, @balance, -withdrawal_amount)
    puts "$#{withdrawal_amount} withdrawn! Your balance is now: $#{@balance}"
  end

  # this is in here for ease of use
  def print_statement
    @statement.print_statement
  end

  private


  def money(amount) # converts amount in float or integer into Money object
    Money.new((amount * 100).to_i)
  end

end
