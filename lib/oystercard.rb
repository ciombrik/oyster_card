class Oystercard

  attr_reader :balance, :in_use
  CARD_LIMIT = 90
  JOURNEY_PRICE = 3

  def initialize
    @balance = 0
      @in_use = false
  end

  def topup(amount)
    raise "Can't top-up, card limit is £90" if @balance >= Oystercard::CARD_LIMIT
    @balance += amount
  end
  private def deduct(amount)
    amount = Oystercard::JOURNEY_PRICE
    @balance -= amount
  end
  def touch_in(card)
    raise "Below minimum value" if @balance < Oystercard::JOURNEY_PRICE
    @in_use = true
  end
  def touch_out(card)
     deduct(JOURNEY_PRICE)
    @in_use = false
  end
  def in_journey?(card)
    if @in_use == true
    end
  end
end
