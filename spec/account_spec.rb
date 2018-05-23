require 'account'

describe Account do
  before(:each) do
    @statement = double(:statement)
    allow(@statement).to receive(:add_transaction)
    @printer = double(:printer)
    allow(@printer).to receive(:print_statement)
    @account = Account.new(@statement, @printer)
  end

  describe '#initialize' do
    it 'has a balance of 0 when created' do
      new_account = Account.new
      expect(new_account.balance).to eq(Money.new(0))
    end
  end

  describe '#deposit' do
    it 'adds the amount passed as an argument to the balance' do
      expect {
        @account.deposit(50.00)
      }.to change { @account.balance.fractional }.by(5000)
    end

    it 'calls add_transaction on statement with correct arguments' do
      expect(@statement).to receive(:add_transaction).with(:deposit, Money.new(100), Money.new(100))
      @account.deposit(1.00)
    end
  end

  describe '#withdraw' do
    it 'removes the amount passed as an argument from the balance' do
      @account.deposit(50.00)
      expect {
        @account.withdraw(10.00)
      }.to change { @account.balance.fractional }.by(-1000)
    end

    it 'calls add_transaction on statement with correct arguments' do
      expect(@statement).to receive(:add_transaction).with(:withdrawal, Money.new(0), Money.new(0))
      @account.withdraw(0)
    end
  end

  describe '#print_statement' do
    it 'calls #print_statement on the printer class' do
      expect(@printer).to receive(:print_statement).with(@statement)
      @account.print_statement
    end
  end
end
