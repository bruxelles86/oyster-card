require 'journey'

describe Journey do
  let(:journey) { described_class.new(:aldgate) }
  it 'initializes with an entry station' do
    expect(journey.entry_station).to eq :aldgate
  end

  describe '#finish' do
    it 'saves the exit station' do
      journey.finish(:angel)
      expect(journey.exit_station).to eq :angel
    end
  end

  describe '#fare' do
    before do
      @station1 = Station.new(:aldgate, 1); @station2 = Station.new(:stratford, 3)
      @trip = Journey.new(@station1)
    end
  it 'returns a fare' do
      @trip.finish(@station1)
      expect(@trip.fare).to eq described_class::MIN_FARE
  end

  it 'charges correct fare when crossing zones' do
      @trip.finish(@station2)
      expect(@trip.fare).to eq described_class::MIN_FARE + 2
  end
  end
end
