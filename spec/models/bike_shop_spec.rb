require 'spec_helper'

describe BikeShop do

  before { @bike_shop = BikeShop.new(name: "Bike Shop", city: "Exampleville", state: "CA", 
  	zip_code:"90405", street_address:"100 Fake Street", phone_number:"555-555-5555", website: "http://www.fake.com") }

  subject { @bike_shop }

  it { should respond_to(:name) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:street_address) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:website) }

  it { should be_valid }

  describe "when name is not present" do
    before { @bike_shop.name = " " }
    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @bike_shop.city = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @bike_shop.state = " " }
    it { should_not be_valid }
  end

  describe "when zip code is not present" do
    before { @bike_shop.zip_code = " " }
    it { should_not be_valid }
  end

  describe "when street address is not present" do
    before { @bike_shop.street_address = " " }
    it { should_not be_valid }
  end

  describe "when phone number is not present" do
    before { @bike_shop.phone_number = " " }
    it { should_not be_valid }
  end

  describe "when website is not present" do
    before { @bike_shop.website = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @bike_shop.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when city is too long" do
    before { @bike_shop.city = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when zip code is too long" do
    before { @bike_shop.zip_code = "a" * 6 }
    it { should_not be_valid }
  end

  describe "when street address is too long" do
    before { @bike_shop.street_address = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when street address is already taken" do
    before do
      bike_shop_with_same_street_address = @bike_shop.dup
      bike_shop_with_same_street_address.street_address = @bike_shop.street_address.upcase
      bike_shop_with_same_street_address.save
    end

    it { should_not be_valid }
  end
end
