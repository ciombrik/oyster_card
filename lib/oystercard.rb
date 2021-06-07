class Oystercard

  attr_reader :balance
  CARD_LIMIT = 90

  def initialize
    @balance = 0
  end

  def topup(amount)
    raise "Can't top-up, card limit is £90" if @balance >= Oystercard::CARD_LIMIT
    @balance += amount
  end

end
