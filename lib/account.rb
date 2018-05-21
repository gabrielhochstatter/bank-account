require 'money'
require 'terminal-table'
require_relative 'transaction'
Money.use_i18n = false

class Account
  attr_reader :balance, :statement, :statement_table_array

  def initialize
    @balance = Money.new(0)
    @statement = Array.new
    @statement_table_array = [["Date", "Change", "Balance"]]
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

  def print_statement
    populate_statement_array
    puts Terminal::Table.new :rows => @statement_table_array
  end

  private

  def populate_statement_array
    @statement.each do |transaction|
      transaction_array = Array.new
      transaction_array << transaction.time.strftime("%D")
      transaction_array << transaction.change
      transaction_array << transaction.final_balance
      @statement_table_array << transaction_array
    end
  end

  def money(amount) # converts amount in float or integer into Money object
    Money.new((amount * 100).to_i)
  end

  def update_statement(final_balance, amount)
    @statement << Transaction.new(@balance, amount)
  end
end
