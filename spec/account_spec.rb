require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'has a balance of 0 when created' do
      new_account = Account.new
      expect(new_account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'adds the amount passed as an argument to the balance' do
      account.deposit(50)
      expect(account.balance).to eq(50)
    end
  end

  describe '#withdraw' do
    it 'removes the amount passed as an argument from the balance' do
      account.deposit(50)
      account.withdraw(10)
      expect(account.balance).to eq(40)
    end
  end
end
