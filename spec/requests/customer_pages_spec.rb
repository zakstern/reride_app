require 'spec_helper'

describe "Customer pages" do

 	subject { page }

 	describe "signup page" do
    	before { visit signup_path }

    	it { should have_content('Sign up') }
    	it { should have_title(full_title('Sign up')) }

    	let(:submit) { "Keep me informed" }

    	describe "with invalid information" do
        	it "should not create a customer" do
            	expect { click_button submit }.not_to change(Customer, :count)
        	end
    	end

    	describe "with valid information" do
        	before do
            	fill_in "First name",   with: "First"
            	fill_in "Last name",    with: "Last"
            	fill_in "Email",       	with: "foobar@example.com"
            	fill_in "Type",         with: "Reseller"
        	end

        	it "should create a Customer" do
            	expect { click_button submit }.to change(Customer, :count).by(1)
        	end
    	end
	end
end