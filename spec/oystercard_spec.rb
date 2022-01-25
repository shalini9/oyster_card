require 'oyster'

describe Oystercard do
  it "can check the starting balance is 0" do
    expect(subject.balance).to eq(0)
  end 

  it "can top-up balance" do
    subject.balance
    expect(subject.top_up(5)).to eq(5)
  end 

  it "can issue error if balance is over maximum limit" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(90)
    expect { subject.top_up (1) }.to raise_error "#{subject.balance} cannot exceed #{maximum_balance}"
  end 

  it "deduct from balance" do
    subject.top_up(11)
    expect { subject.deduct(10) }.to change{subject.balance}.by -10
  end
  
  it "is initially not in a journey" do
    expect(subject).not_to be_in_journey
    # in_journey? use 'be_' and remove '?'' and for boolean methods
  end

  it "can touch in" do
    subject.top_up(5)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    subject.top_up(5)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
  
  it "can issue error if balance is under minimum balance £1" do
    expect { subject.touch_in }.to raise_error "You do not have minimum balance of £1 to travel"
  end 

  it "can deduct fare from balance when you touch out" do
    subject.top_up(5)
    subject.touch_in        
    expect { subject.touch_out }.to change{subject.balance}.by (-Oystercard::MINIMUM_BALANCE)
  end 

end 