require "oystercard"

describe Oystercard do

  let(:oystercard) { Oystercard.new }

  it 'shows a new card has 0 balance' do
    expect(oystercard.balance).to eq 0
  end

  it 'stores an empty list of journeys' do
    expect(oystercard.journeys).to be_empty
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
    let(:exit_station){ double :station }
    let(:journey){{entry_station: entry_station, exit_station: exit_station}}
    it "deduct the money for the journey" do
      oystercard.topup(10)
      expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -3
    end
    let(:entry_station){ double :station }
    it "touch_in remembers the entry station" do
      oystercard.topup(5)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
    # it "allow card to touch in" do
    #   oystercard.topup(5)
    #   oystercard.touch_in(entry_station)
    #   expect(oystercard.in_use).to eq true
    # end
    it "rasies an error when below minimum tap in value" do

      expect { oystercard.touch_in(entry_station) }.to raise_error "Below minimum value"  if oystercard.balance == Oystercard::JOURNEY_PRICE
    end
    # it "allow card to touch out" do
    #   oystercard.touch_out(exit_station)
    #   expect(oystercard.in_use).to eq false
    # end
   
    it "touch_out remembers the exit station" do
      oystercard.topup(5)
      oystercard.touch_out(exit_station)
      expect(oystercard.exit_station).to eq exit_station
    end
    # it "shows if the card is in use " do
    #   oystercard.topup(10)
    #   oystercard.touch_in(entry_station)
    #   expect(oystercard.in_use).to eq true
    # end
    it "can store journeys" do

      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journeys).to include (journey)
    end
  end
end
