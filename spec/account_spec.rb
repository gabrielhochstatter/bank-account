require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it "has a balance of 0 when created" do
      new_account = Account.new
      expect(new_account.balance).to eq(0)
    end
  end
end
