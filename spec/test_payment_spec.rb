require 'rspec'
require 'spec_helper'

describe "fixed payment test" do
  it 'should be the monthly payment' do
    annuity_given_present(100000000, 0.0144594763, 180).should eq(1563975.1395)
  end
end

describe "variable payment test" do
  it "should be the monthly variable payment" do
    variable_payment(10000000.0,40).should eq(250000)
  end
end

describe "due variable payment amortization" do
  it "should be a hash of payments" do
    due_variable_payment_amortization(5,10000,1.8,2000).should be_an(Array)
  end
end

describe "anticipated vabiable payment amortization" do
  it "should be a hash of payments" do
    anticipated_variable_payment_amortization(5,10000,1.8,2000).should be_an(Array)
  end
end

describe "due fixed payment amortization" do
  it "should be a hash of payments" do
    due_fixed_payment_amortization(5,10000,1.8,2000).should be_an(Array)
  end
end

describe "anticipated fixed payment amortization" do
  it "should be a hash of payments" do
    anticipated_fixed_payment_amortization(5,10000,1.8,2000).should be_an(Array)
  end
end

