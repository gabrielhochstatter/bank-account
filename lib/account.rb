require 'money'
require_relative 'transaction'
Money.use_i18n = false

class Account
  attr_reader :balance, :statement

  def initialize
    @balance = Money.new(0)
    @statement = Array.new
  end

  def deposit(amount)
    deposit_amount = money(amount)
    @balance += deposit_amount
    update_statement(@balance, deposit_amount)
    puts "#{deposit_amount} deposited! Your balance is now: $#{@balance}"
  end

  def withdraw(amount)
    withdrawal_amount = money(amount)
    @balance -= withdrawal_amount
    update_statement(@balance, -withdrawal_amount)
    puts "$#{withdrawal_amount} withdrawn! Your balance is now: $#{@balance}"
  end

  private

  def money(amount) # converts amount in float or integer into Money object
    Money.new((amount * 100).to_i)
  end

  def update_statement(final_balance, amount)
    @statement << Transaction.new(@balance, amount)
  end
end
