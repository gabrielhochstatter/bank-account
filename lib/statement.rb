require 'money'
Money.use_i18n = false

class Statement
  attr_reader :transactions, :table_array

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @transactions = []
    @table_array = [%w[Date Deposited Withdrawn Balance]]
  end

  def add_transaction(type, final_balance, change)
    @transactions << @transaction_class.new(type, final_balance, change)
  end
end
