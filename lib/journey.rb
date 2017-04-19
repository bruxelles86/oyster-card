require_relative 'oystercard'

class Journey

  MIN_FARE = 1
  PEN_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def fare
    return PEN_FARE if !@entry_station || !@exit_station
    MIN_FARE
  end

  def finish(station)
    @exit_station = station
  end

end
