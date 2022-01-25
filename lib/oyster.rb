class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys
  
  def initialize(balance = 0)
    @balance = balance
    @journeys = {}
  end 

  def top_up(money)
    # fail is for user raise is for coders
    fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE
    @balance += money
  end 
 
  def in_journey?
    !!entry_station
  end 

  def touch_in(entry_station)
    fail "You do not have minimum balance of £1 to travel" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    @exit_station = exit_station
    @journeys[:entry_station] = entry_station
    @journeys[:exit_station] = exit_station
    @entry_station = nil
  end

  private
  def deduct(money)
    @balance -= money
  end
  
end 

