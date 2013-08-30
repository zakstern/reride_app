require 'spec_helper'

describe Bike do

  let(:testcustomer) { FactoryGirl.create(:customer) }  
  before { @bike = testcustomer.bikes.build(year_manufactured: "2013-08-29", make: "Example", model: "Example Model", 
    kind:"Road", msrp: 3500.5, current_price: 2000.5) }

  subject { @bike }

  it { should respond_to(:year_manufactured) }
  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:kind) }
  it { should respond_to(:msrp) }
  it { should respond_to(:current_price) }

  it { should be_valid }

  describe "when year manufactured is not present" do
    before { @bike.year_manufactured = " " }
    it { should_not be_valid }
  end

  describe "when make is not present" do
    before { @bike.make = " " }
    it { should_not be_valid }
  end

  describe "when model is not present" do
    before { @bike.model = " " }
    it { should_not be_valid }
  end

  describe "when kind is not present" do
    before { @bike.kind = " " }
    it { should_not be_valid }
  end

  describe "when msrp is not present" do
    before { @bike.msrp = " " }
    it { should_not be_valid }
  end

  describe "when current price is not present" do
    before { @bike.current_price = " " }
    it { should_not be_valid }
  end
end
