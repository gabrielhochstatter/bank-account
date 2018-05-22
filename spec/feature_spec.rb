require 'account'

describe "Integration Tests" do
  it "add_transaction adds a transaction to the statement's array" do
    s = Statement.new
    s.add_transaction(:deposit, Money.new(5000), Money.new(5000))
    expect(s.transactions[0]).to be_a(Transaction)
    expect(s.transactions[0].type).to eq(:deposit)
  end
end
