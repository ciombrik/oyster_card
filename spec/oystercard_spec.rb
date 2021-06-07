require "oystercard"

describe Oystercard do

  let(:oystercard) { Oystercard.new }

  it 'shows a new card has 0 balance' do
    expect(oystercard.balance).to eq 0
  end

  it 'adds money to the card' do
    oystercard.topup(20)
    expect(oystercard.balance).to eq 20
  end

end
