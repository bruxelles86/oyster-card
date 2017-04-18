class Oystercard
  attr_reader :balance, :in_journey, :entry_station
  DEFAULT_LIMIT = 90
  MIN_FUNDS = 1
  FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top-up would exceed £#{DEFAULT_LIMIT} limit" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail 'Insuficient funds' if @balance < MIN_FUNDS
    @entry_station = station
  end

  def touch_out
    spend(FARE)
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  private

  def spend(amount)
    @balance -= amount
  end

end
