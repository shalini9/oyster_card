require 'oyster'

describe Oystercard do
  it "can check the starting balance is 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end 


end 