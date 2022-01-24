require 'oyster'

describe Oystercard do
  it "can check the starting balance is 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end 

  it "can top-up balance" do
    oystercard = Oystercard.new
    oystercard.balance
    expect(oystercard.top_up(5)).to eq(5)
  end 

  it "can issue error if balance is over maximum limit" do
    oystercard = Oystercard.new
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    oystercard.top_up maximum_balance
    expect { oystercard.top_up 4 }.to raise_error("Maximum balance of exceeded")
  end 




end 