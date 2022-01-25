class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance
  
  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end 

  def top_up(money)
    # fail is for user raise is for coders
    fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE
    @balance += money
  end 
 
  def in_journey?
    @in_journey
  end 

  def touch_in
    @in_journey = true
    fail "You do not have minimum balance of £1 to travel" if @balance < MINIMUM_BALANCE
  end
  
  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
  end

  private
  def deduct(money)
    @balance -= money
  end
  
end 

