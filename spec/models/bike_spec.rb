require 'spec_helper'

describe Bike do

  let(:testcustomer) { FactoryGirl.create(:customer) }  
  before { @bike = testcustomer.bikes.build(year_manufactured: "2013-08-29", make: "Example", make_id: 1, model: "Example Model", model_id: 1,
    kind:"Road", msrp: 3500.5, current_price: 2000.5) }

  subject { @bike }

  it { should respond_to(:year_manufactured) }
  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:kind) }
  it { should respond_to(:msrp) }
  it { should respond_to(:current_price) }
  it { should have_many(:quotes)}
  it { should have_many(:customers)}

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

  describe "when make_id is not present" do
    before { @bike.make_id = " " }
    it { should_not be_valid }
  end

  describe "when model_id is not present" do
    before { @bike.model_id = " " }
    it { should_not be_valid }
  end
end
