require 'spec_helper'

describe Quote do

  let(:customer) { FactoryGirl.create(:customer) }
  let(:bike) { FactoryGirl.create(:bike) }
  let(:quote) { customer.quotes.build(bike_id: bike.id) }

  subject { quote }

  it { should be_valid }
  it { should belong_to(:bike) }
  it { should belong_to(:customer) }

  describe "customer methods" do
    it { should respond_to(:customer) }
    its(:customer) { should eq customer }
  end

  describe "bike methods" do
    it { should respond_to(:bike) }
    its(:bike) { should eq bike }
  end

end