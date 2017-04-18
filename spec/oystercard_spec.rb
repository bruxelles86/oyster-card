require 'oystercard'

describe Oystercard do
let(:card) { Oystercard.new }

  it { is_expected.to respond_to(:balance) }

  it 'initializes with a balance of zero' do
    expect(card.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

describe '#touch_in' do

  it 'touches in' do
    card.touch_in
    expect(card).to be_in_journey
  end
end

describe '#touch_out' do

  it 'touches out' do
    card.touch_in
    card.touch_out
    expect(card).not_to be_in_journey
  end
end

describe '#in_journey?' do

  it 'checks the journey status' do
    expect(card.in_journey?).to eq(true).or(eq(false))
  end
end

describe '#top_up' do
  it 'tops up balance by specified amount' do
    card.top_up(15)
    expect(card.balance).to eq 15
end

  it 'raises an error if top-up would push balance above £90' do
     expect{ card.top_up(100) }.to raise_error "Top-up would exceed £#{Oystercard::DEFAULT_LIMIT} limit"
  end
end


end
