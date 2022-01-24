class Oystercard
  
  MAXIMUM_BALANCE = 90

  attr_reader :balance
  
  def initialize
    @balance = 0
  end 

  def top_up(money)
    fail "Maximum balance of exceeded" if money + @balance > MAXIMUM_BALANCE
    @balance += money
  end 




end 