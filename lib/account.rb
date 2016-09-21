class Account

  attr_reader :current_balance, :statement

  def initialize
    @current_balance = 0
    @statement = []
  end

  def deposit(deposit_amount)
    @current_balance += deposit_amount
    add_transaction("credit", deposit_amount)
  end

  def withdrawal(withdrawal_amount)
    @current_balance -= withdrawal_amount
    add_transaction("debit", withdrawal_amount)
  end

  def print_statement
    p "date || credit || deposit || balance"
    @statement.reverse!
    @statement.each do |record|
      p "#{record[:date]} || #{record[:credit]} || #{record[:debit]} || #{record[:balance]}"
    end
  end

  private

  def todays_date
    Time.new.strftime("%d/%m/%Y")
  end

  def add_transaction(tansaction_name, transaction_amount)
    @statement << { date: todays_date, "#{tansaction_name.to_sym}": transaction_amount, balance: @current_balance }
  end

end
