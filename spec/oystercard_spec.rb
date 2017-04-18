require 'oystercard'

describe Oystercard do
let(:card) { Oystercard.new }
let(:station) { double("station") }

before do
@min = Oystercard::MIN_FUNDS
end
  it { is_expected.to respond_to(:balance) }

  it 'initializes with a balance of zero' do
    expect(card.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#top_up' do
    it 'tops up balance by specified amount' do
      subject.top_up(15)
      expect(subject.balance).to eq 15
    end
end
    it 'raises an error if top-up would push balance above £90' do
      expect{ subject.top_up(100) }.to raise_error "Top-up would exceed £#{Oystercard::DEFAULT_LIMIT} limit"
    end



describe '#touch_in' do

  it 'touches in' do
    card.top_up(@min); card.touch_in(station)
    expect(card).to be_in_journey
  end

  it 'raises an error when insufficient funds' do
    expect { card.touch_in(station) }.to raise_error 'Insuficient funds'
  end

  it 'records the entry station' do
    card.top_up(@min); card.touch_in(station)
    expect(card.entry_station).to eq station
  end
end

describe '#touch_out' do

  it 'touches out' do
    card.top_up(@min); card.touch_in(station); card.touch_out
    expect(card).not_to be_in_journey
  end

  it 'charges minimum fare' do
  card.top_up(10); card.touch_in(station)
  expect{ card.touch_out }.to change{ card.balance }.by -Oystercard::FARE
  end

  it 'erases entry station from memory upon touching out' do
    card.top_up(@min); card.touch_in(station); card.touch_out
    expect(card.entry_station).to be_nil
  end
end

describe '#in_journey?' do

  it 'checks the journey status' do
    expect(card.in_journey?).to eq(true).or(eq(false))
  end
end
end
