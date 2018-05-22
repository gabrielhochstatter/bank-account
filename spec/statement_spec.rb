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

  # describe '#print_statement' do
  #   it 'populates the array for the terminal-table gem correctly' do
  #     @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
  #     expected_array = [
  #       %w[Date Deposited Withdrawn Balance],
  #       [Time.now.strftime('%D'), '$50.00', '', '$50.00']
  #     ]
  #     @statement.print_statement
  #     expect(@statement.table_array).to eq expected_array
  #   end
  #
  #   it 'populates the array correctly for multiple transactions' do
  #     @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
  #     @statement.add_transaction(:withdrawal, Money.new(2500), -Money.new(2500))
  #     expected_array = [
  #       %w[Date Deposited Withdrawn Balance],
  #       [Time.now.strftime('%D'), '', '$-25.00', '$25.00'],
  #       [Time.now.strftime('%D'), '$50.00', '', '$50.00']
  #     ]
  #     @statement.print_statement
  #     expect(@statement.table_array).to eq expected_array
  #   end
  # end
end
