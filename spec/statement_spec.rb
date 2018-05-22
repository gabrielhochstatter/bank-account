require 'statement'

describe Statement do
  before(:each) do
    @statement = Statement.new
  end

  describe 'add_transaction' do
    it 'creates a transaction with the correct attributes' do
      @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
      expect(@statement.transactions[0]).to be_a(Transaction)
      expect(@statement.transactions[0].change).to eq('$50.00')
      expect(@statement.transactions[0].final_balance).to eq('$50.00')
    end
  end

  describe '#print_statement' do
    it 'populates the array for the terminal-table gem correctly' do
      @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
      expected_array = [
        %w[Date Deposited Withdrawn Balance],
        [Time.now.strftime('%D'), '$50.00', '', '$50.00']
      ]
      @statement.print_statement
      expect(@statement.table_array).to eq expected_array
    end

    it 'populates the array correctly for multiple transactions' do
      @statement.add_transaction(:deposit, Money.new(5000), Money.new(5000))
      @statement.add_transaction(:withdrawal, Money.new(2500), -Money.new(2500))
      expected_array = [
        %w[Date Deposited Withdrawn Balance],
        [Time.now.strftime('%D'), '', '$-25.00', '$25.00'],
        [Time.now.strftime('%D'), '$50.00', '', '$50.00']
      ]
      @statement.print_statement
      expect(@statement.table_array).to eq expected_array
    end
  end
end
