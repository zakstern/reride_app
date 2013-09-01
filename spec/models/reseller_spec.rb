require 'spec_helper'

describe Reseller do

  
  before { @reseller = Reseller.new(name: "Reseller", city: "Exampleville", state: "CA", 
    zip_code:"90405", street_address:"100 Fake Street", phone_number:"555-555-5555", website: "http://www.fake.com") }

  subject { @reseller }

  it { should respond_to(:name) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:street_address) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:website) }
  it { should have_many(:users)}

  it { should be_valid }

  describe "when name is not present" do
    before { @reseller.name = " " }
    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @reseller.city = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @reseller.state = " " }
    it { should_not be_valid }
  end

  describe "when zip code is not present" do
    before { @reseller.zip_code = " " }
    it { should_not be_valid }
  end

  describe "when street address is not present" do
    before { @reseller.street_address = " " }
    it { should_not be_valid }
  end

  describe "when phone number is not present" do
    before { @reseller.phone_number = " " }
    it { should_not be_valid }
  end

  describe "when website is not present" do
    before { @reseller.website = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @reseller.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when city is too long" do
    before { @reseller.city = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when zip code is too long" do
    before { @reseller.zip_code = "a" * 6 }
    it { should_not be_valid }
  end

  describe "when street address is too long" do
    before { @reseller.street_address = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when street address is already taken" do
    before do
      reseller_with_same_street_address = @reseller.dup
      reseller_with_same_street_address.street_address = @reseller.street_address.upcase
      reseller_with_same_street_address.save
    end

    it { should_not be_valid }
  end

  it "should destroy users when reseller is destroyed" do
    @reseller.save
    @user = FactoryGirl.create(:reseller_user, profile: @reseller)
    profile = @user.profile
    lambda { 
      profile.destroy
    }.should change(User, :count).by(-1)
  end
end
