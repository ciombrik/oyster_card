class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  CARD_LIMIT = 90
  JOURNEY_PRICE = 3

  def initialize
    @balance = 0
    @journeys = {}
  end

  def topup(amount)
    raise "Can't top-up, card limit is £90" if @balance >= Oystercard::CARD_LIMIT
    @balance += amount
  end
  
  private  def deduct(amount)
    amount = Oystercard::JOURNEY_PRICE
    @balance -= amount
  end

  def touch_in(station)
    raise "Below minimum value" if @balance == Oystercard::JOURNEY_PRICE
    @entry_station = station
  end

  def touch_out(station)
     deduct(JOURNEY_PRICE)
    @exit_station = station
    @journeys[:entry_station] =  @entry_station 
    @journeys[:exit_station] =  @exit_station
    @entry_station = nil  
  end

  def in_journey?
    !!entry_station
  end
end 