require 'spec_helper'

describe Quote do

  let(:customer) { FactoryGirl.create(:customer) }
  let(:bike) { FactoryGirl.create(:bike) }
  let(:quote) { customer.quotes.build(bike_id: bike.id) }

  subject { quote }

  it { should be_valid }

  describe "customer methods" do
    it { should respond_to(:customer) }
    its(:customer) { should eq customer }
  end

  describe "bke methods" do
    it { should respond_to(:bike) }
    its(:bike) { should eq bike }
  end

end