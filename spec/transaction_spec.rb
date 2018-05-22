require 'transaction'

describe Transaction do
  let(:balance) { double(:money, format: '$10.00') }

  describe '#initialize' do
    it 'new transactions store when they happened' do
      transaction = Transaction.new(:deposit, balance)
      expect(transaction.time).to be_a(Time)
    end
  end

  describe '#change' do
    it 'displays the amount withdrawn' do
      amount = Money.new(100)
      transaction = Transaction.new(:deposit, balance, -amount)
      expect(transaction.change).to eq('$-1.00')
    end

    it 'displays the amount deposited' do
      amount = Money.new(100)
      transaction = Transaction.new(:deposit, balance, amount)
      expect(transaction.change).to eq('$1.00')
    end
  end

  describe '#final_balance' do
    it 'stores the balance of the account after the transaction' do
      balance = Money.new(10000)
      transaction = Transaction.new(:deposit, balance)
      expect(transaction.final_balance).to eq('$100.00')
    end
  end

  describe '#type' do
    it 'returns the type of transaction' do
      transaction = Transaction.new(:deposit, balance)
      expect(transaction.type).to eq(:deposit)
    end
  end
end
