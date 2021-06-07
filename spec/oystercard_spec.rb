require "oystercard"

describe Oystercard do

  let(:oystercard) { Oystercard.new }

  it 'shows a new card has 0 balance' do
    expect(oystercard.balance).to eq 0
  end

end
