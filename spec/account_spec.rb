require 'account'

describe Account do
  # subject(:account) { described_class.new }
  before(:each) do
    @account = Account.new
  end

  describe '#initialize' do
    it 'has a balance of 0 when created' do
      new_account = Account.new
      expect(new_account.balance).to eq(Money.new(0))
    end
  end

  describe '#deposit' do
    it 'adds the amount passed as an argument to the balance' do
      @account.deposit(50.00)
      expect(@account.balance).to eq(Money.new(5000))
    end

    it 'creates a relevant transaction object and places it in the statement' do
      @account.deposit(50.00)
      expect(@account.statement[0]).to be_a(Transaction)
      expect(@account.statement[0].change).to eq("$50.00")
      expect(@account.statement[0].final_balance).to eq("$50.00")
    end
  end

  describe '#withdraw' do
    it 'removes the amount passed as an argument from the balance' do
      @account.deposit(50.00)
      @account.withdraw(10.00)
      expect(@account.balance).to eq(Money.new(4000))
    end

    it 'creates a relevant transaction object and places it in the statement' do
      @account.deposit(50.00)
      @account.withdraw(10.00)
      expect(@account.statement[1]).to be_a(Transaction)
      expect(@account.statement[1].change).to eq("$-10.00")
      expect(@account.statement[1].final_balance).to eq("$40.00")
    end
  end
end
