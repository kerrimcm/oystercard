class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1
  MIN_FARE = 1
  attr_accessor :balance, :entry_station, :journeys, :exit_station

  def initialize(entry_station = nil)
    @balance = 0
    @entry_station = entry_station
    @journeys = []
  end

  def top_up(amount)
    fail "Max limit of #{MAXIMUM_LIMIT}, cannot top-up" if max_limit?(amount)
    @balance += amount
  end

  def in_journey?
    !@entry_station.nil?
  end 

  def touch_in(station)
    raise 'Insufficient funds, please top up' if minimum_balance?
    @entry_station = station
  end 

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    store_journeys
    @entry_station = nil
  end 

  private

  def max_limit?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

  def minimum_balance?
    @balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def store_journeys
    @journeys << {@entry_station => @exit_station} 
  end
end