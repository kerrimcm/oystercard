class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    raise "Exceeded maximum amount: £#{MAXIMUM_BALANCE}" if over_max_balance?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def over_max_balance?(amount)
    (amount + balance) > MAXIMUM_BALANCE
  end
end 