require 'money'
Money.use_i18n = false

class Statement
  attr_reader :transactions, :table_array

  def initialize
    @transactions = []
    @table_array = [%w[Date Deposited Withdrawn Balance]]
  end

  def add_transaction(type, final_balance, change)
    @transactions << Transaction.new(type, final_balance, change)
  end

  def print_statement
    populate_table_array
    puts Terminal::Table.new(rows: @table_array)
  end

  private

  def populate_table_array
    @transactions.each do |transaction|
      transaction_array = []
      transaction_array << transaction.time.strftime('%D')
      if transaction.type == :deposit
        transaction_array << transaction.change
        transaction_array << ''
      else
        transaction_array << ''
        transaction_array << transaction.change
      end
      transaction_array << transaction.final_balance
      @table_array.insert(1, transaction_array)
    end
  end
end
