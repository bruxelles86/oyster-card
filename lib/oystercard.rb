require_relative 'journey'
require_relative 'station'
require_relative 'journeylog'

class Oystercard
  attr_reader :balance, :in_journey, :journeylog
  DEFAULT_LIMIT = 90
  MIN_FUNDS = 1
  FARE = 1

  def initialize
    @balance = 0
    @journeylog = JourneyLog.new(Journey)
    end

  def top_up(amount)
    fail "Top-up would exceed £#{DEFAULT_LIMIT} limit" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    spend(@journeylog.journey.fare) if in_journey?
    fail 'Insufficient funds' if @balance < MIN_FUNDS
    @journeylog.start(station)
  end

  def touch_out(station)
    @journeylog.start if !in_journey?
    @journeylog.finish(station)
    spend(@journeylog.journey.fare)
  end

  def in_journey?
    !!@journeylog.journey
  end

  def save_journey
    @journeylog.save({ entry_station: @journeylog.journey.entry_station, exit_station: @journeylog.journey.exit_station })
    @journeylog.journey = nil
  end

  private

  def spend(amount)
    @balance -= amount
    save_journey
  end

end
