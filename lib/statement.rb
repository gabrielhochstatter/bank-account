require 'money'
Money.use_i18n = false

class Statement
  attr_reader :transactions, :table_array

  def initialize
    @transactions = []
    @table_array = [%w[Date Change Balance]]
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
      transaction_array << transaction.change
      transaction_array << transaction.final_balance
      @table_array.insert(1, transaction_array)
    end
  end
end
