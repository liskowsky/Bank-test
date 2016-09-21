class Account

  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    @statement << { date: Time.new.strftime("%d/%m/%Y"), credit: deposit_amount, balance: @balance}
  end

  def withdrawal(withdrawal_amount)
    @balance -= withdrawal_amount
    @statement << { date: Time.new.strftime("%d/%m/%Y"), debit: withdrawal_amount, balance: @balance}
  end

  def print_statement
    p "date || credit || deposit || balance"
    @statement.each do |record|
      p " #{record[:date]} || #{record[:credit]} || #{record[:debit]} || #{record[:balance]} "
    end
  end

end
