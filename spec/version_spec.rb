require 'rspec'
require 'spec_helper'

describe "My behaviour" do

  it 'should be the version' do
    FinancialMaths::VERSION.should_not be_nil
  end
end