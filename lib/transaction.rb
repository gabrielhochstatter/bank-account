require 'money'
Money.use_i18n = false

class Transaction
  attr_reader :time, :change, :final_balance, :type

  def initialize(type, final_balance, change = Money.new(0))
    @time = Time.now.strftime('%d/%m/%y')
    @change = change.format
    @final_balance = final_balance.format
    @type = type
  end
end
