require 'journeylog'

describe JourneyLog do
  let(:journeylog) { described_class.new(Journey) }

  it 'Can create objects from class journey' do
    expect(journeylog.journey_class.new.class).to eq Journey
  end

  it 'Records start station in a journey object' do
    journeylog.start(:aldgate)
    expect(journeylog.journey.entry_station).to eq :aldgate
  end

  it 'Records exit station in a journey object' do
    journeylog.start(:aldgate); journeylog.finish(:moorgate)
    expect(journeylog.journey.exit_station).to eq :moorgate
  end
end
