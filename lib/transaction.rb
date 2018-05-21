require 'money'
Money.use_i18n = false

class Transaction
  attr_reader :time, :change, :final_balance

  def initialize(final_balance, change = Money.new(0))
    @time = Time.now
    @change = change.format
    @final_balance = final_balance.format
  end

end
