require 'transaction'
require 'money'

# HELLO COACHES, ARE YOU REALLY CHECKING OUR OLD COMMITS ¯\_(ツ)_/¯ ?

describe Transaction do
  let(:balance) { double(:final_balance, format: '$10.00')}

  describe '#initialize' do
    it "new transactions store when they happened" do
      transaction = Transaction.new(balance)
      expect(transaction.time).to be_a(Time)
    end
  end

  describe '#change' do
    it "displays the amount withdrawn" do
      amount = Money.new(100)
      transaction = Transaction.new(balance, -amount)
      expect(transaction.change).to eq("$-1.00")
    end

    it 'displays the amount deposited' do
      amount = Money.new(100)
      transaction = Transaction.new(balance, amount)
      expect(transaction.change).to eq("$1.00")
    end
  end

  describe '#final_balance' do
    it 'stores the balance of the account after the transaction' do
      balance = Money.new(10000)
      transaction = Transaction.new(balance)
      expect(transaction.final_balance).to eq("$100.00")
    end
  end

end
