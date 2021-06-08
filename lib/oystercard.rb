class Oystercard

  attr_reader :balance, :in_use, :entry_station, :exit_station, :journeys
  CARD_LIMIT = 90
  JOURNEY_PRICE = 3

  def initialize
    @balance = 0
    @in_use = false
    @journeys = Array.new
  end

  def topup(amount)
    raise "Can't top-up, card limit is £90" if @balance >= Oystercard::CARD_LIMIT
    @balance += amount
  end
  private def deduct(amount)
    amount = Oystercard::JOURNEY_PRICE
    @balance -= amount
  end
  def touch_in(station)
    raise "Below minimum value" if @balance < Oystercard::JOURNEY_PRICE
    @in_use = true
    @entry_station = station
    @in_journey = true
  end
  def touch_out(station)
     deduct(JOURNEY_PRICE)
    @in_use = false
    @exit_station = station
    @entry_station = nil
    # example of final product = [[{entry: Liverpool steet}, {exit: Basildon}],etc]
  end
  def in_journey?()
    if @in_use == true
      !!entry_station
    end
  end
end
