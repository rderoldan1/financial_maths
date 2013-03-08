require 'rspec'
require 'spec_helper'

describe "fixed payment test" do

  it 'should be the monthly payment' do

    annuity_given_present(100000000, 0.0144594763, 180).should eq(1563975.1395)

  end
end