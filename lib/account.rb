require 'money'
require_relative 'transaction'
Money.use_i18n = false

class Account
  attr_reader :balance

  def initialize
    @balance = Money.new(0)
  end

  def deposit(amount)
    deposit_amount = Money.new((amount * 100).to_i)
    @balance += deposit_amount
    puts "#{deposit_amount} deposited! Your balance is now: $#{@balance}"
  end

  def withdraw(amount)
    withdrawal_amount = Money.new((amount * 100).to_i)
    @balance -= withdrawal_amount
    puts "$#{withdrawal_amount} withdrawn! Your balance is now: $#{@balance}"
  end
end
