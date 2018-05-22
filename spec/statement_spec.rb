require 'statement'

describe Statement do
  let(:transaction) { double(:transaction) }

  before(:each) do
    allow(transaction).to receive(:new)
    @statement = Statement.new(transaction)
  end

  describe 'add_transaction' do
    it 'creates a transaction with the correct arguments' do
      expect(transaction).to receive(:new).with(:deposit, Money.new(5000), Money.new(5000))
      @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
    end

    it 'adds something to the transactions array' do
      expect {
        @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
      }.to change { @statement.transactions.length }.by(1)
    end
  end
end
