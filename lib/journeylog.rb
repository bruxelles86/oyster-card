require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :journeys
  attr_accessor :current_journey

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station = nil)
    @current_journey = @journey_class.new(station)
  end

  def save(journeys)
    @journeys << journeys
  end

  def finish(station)
    @current_journey.finish(station)
  end

end
