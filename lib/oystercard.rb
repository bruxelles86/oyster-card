class Oystercard
  attr_reader :balance, :in_journey
  DEFAULT_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Top-up would exceed £#{DEFAULT_LIMIT} limit" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
