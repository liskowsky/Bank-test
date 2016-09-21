require 'account'

describe Account do
  describe "when new account is created" do
    it "has a balance of 0 by default" do
      account = Account.new
      expect(account.current_balance).to eq 0
    end
  end

  describe "existing account" do
    account = Account.new

    it "can be topped up" do
      expect{ account.deposit(500) }.to change{ account.current_balance }.by 500
    end

    it "can have a withdrawal" do
      expect{ account.withdrawal(500) }.to change{ account.current_balance }.by -500
    end
  end

  describe "statement" do
    context "when there was no transactions" do
      it "has no data" do
        account = Account.new
        expect(account.statement).to be_empty
      end
    end

    context "when a deposit was made" do
      account = Account.new
      account.deposit 500
      it "shows the date when deposit was made" do
        time = Time.new.strftime("%d/%m/%Y")
        expect(account.statement[0][:date]).to eq time
      end
    end

  end

end
