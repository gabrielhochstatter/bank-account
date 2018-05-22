require 'printer'

describe Printer do
  let(:transaction_1) {
    double(:transaction, time: "31/12/2017",
      change: Money.new(10000),
      final_balance: Money.new(10000),
      type: :deposit
    )
  }
  let(:transaction_2) {
    double(:transaction, time: "01/01/2018",
      change: Money.new(1000),
      final_balance: Money.new(9000),
      type: :withdrawal
    )
  }
  let(:statement) {
    double(:statement, transactions: [transaction_1, transaction_2])
  }

  describe '#print_statement' do
    it 'prints out the statment in a table according to spec' do
      expected_output = "date || credit || debit || balance\n01/01/2018 || || 10.00 || 90.00\n31/12/2017 || 100.00 || || 100.00\n"
      expect { Printer.print_statement(statement) }.to output(expected_output).to_stdout
    end
  end
end
