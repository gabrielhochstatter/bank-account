require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'has a balance of 0 when created' do
      new_account = Account.new
      expect(new_account.balance).to eq(Money.new(0))
    end
  end

  describe '#deposit' do
    it 'adds the amount passed as an argument to the balance' do
      account.deposit(50.00)
      expect(account.balance).to eq(Money.new(5000))
    end
  end

  describe '#withdraw' do
    it 'removes the amount passed as an argument from the balance' do
      account.deposit(50.00)
      account.withdraw(10.00)
      expect(account.balance).to eq(Money.new(4000))
    end
  end
end
