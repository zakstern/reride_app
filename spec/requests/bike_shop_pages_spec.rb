require 'spec_helper'

describe "BikeShopPages" do

	subject { page}

	describe "signup page" do
		before { visit bike_shop_signup_path}

		it { should have_content("Bike Shop Signup") }
		it { should have_title("Bike Shop Signup")}
	end

	describe "signup" do

	    before { visit bike_shop_signup_path }

	    let(:submit) { "Signup My Bike Shop" }

	    describe "with invalid information" do
	      it "should not create a bike shop" do
	        expect { click_button submit }.not_to change(BikeShop, :count)
	      end
    end

    describe "with valid information" do
      before do
        fill_in "Shop Name",         with: "Example Store"
        fill_in "Street Address",	with: "100 Fake Street"
        fill_in "City",        	with: "City"
        fill_in "State",     	with: "CA"
        fill_in "Zip Code", 	with: "90405"
        fill_in "Phone Number",	with: "999-999-9999"
        fill_in "Website",		with: "http://www.example.com"
        fill_in "First Name",	with: "Jim"
        fill_in "Last Name",	with: "Smith"
        fill_in "Email", 		with: "fake@fake.com"
      end

      it "should create a bike shop" do
        expect { click_button submit }.to change(BikeShop, :count).by(1)
      end
    end
  end

	describe "profile page" do
	    let(:bike_shop) { FactoryGirl.create(:bike_shop) }
	    before { visit bike_shop_path(bike_shop) }

	    it { should have_title(bike_shop.name) }
	    it { should have_content(bike_shop.name) }
	    it { should have_content(bike_shop.street_address) }
	    it { should have_content(bike_shop.city) }
	    it { should have_content(bike_shop.state) }
	    it { should have_content(bike_shop.zip_code) }
	    it { should have_content(bike_shop.phone_number) }
	    it { should have_content(bike_shop.website) }

	    it { should have_content(bike_shop.user.first_name) }
	    it { should have_content(bike_shop.user.last_name) }
	    it { should have_content(bike_shop.user.email) }
	 end
  
end
