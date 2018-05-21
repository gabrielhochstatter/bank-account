class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    puts "$#{amount} deposited! Your balance is now: $#{@balance}"
  end

  def withdraw(amount)
    @balance -= amount
    puts "$#{amount} withdrawn! Your balance is now: $#{@balance}"
  end
end
