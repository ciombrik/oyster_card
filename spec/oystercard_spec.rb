require "oystercard"

describe Oystercard do

  let(:oystercard) { Oystercard.new }

  it 'shows a new card has 0 balance' do
    expect(oystercard.balance).to eq 0
  end

  describe '#topup' do

    it 'adds money to the card' do
      oystercard.topup(20)
      expect(oystercard.balance).to eq 20
    end

    context 'when card is at limit' do
      it 'raises an error' do
        oystercard.topup(90)
        expect { oystercard.topup(1) }.to raise_error "Can't top-up, card limit is £90"
      end
    end
  end

end
