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
  describe "#journey" do
    it "deduct the money for the journey" do
      oystercard.topup(10)
      expect{ oystercard.touch_out 3 }.to change{ oystercard.balance }.by -3
    end
    it "allow card to touch in" do
      oystercard.topup(5)
      oystercard.touch_in(:card)
      expect(oystercard.in_use).to eq true
    end
    it "rasies an error when below minimum tap in value" do
      expect { oystercard.touch_in(:card) }.to raise_error "Below minimum value"
    end
    it "allow card to touch out" do
      oystercard.touch_out(:card)
      expect(oystercard.in_use).to eq false
    end
    it "shows if the card is in use " do
      oystercard.topup(10)
      oystercard.touch_in(:card)
      expect(oystercard.in_use).to eq true
    end
  end
end
