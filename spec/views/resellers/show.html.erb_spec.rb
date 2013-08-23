require 'spec_helper'

describe "resellers/show" do
  before(:each) do
    @reseller = assign(:reseller, stub_model(Reseller,
      :name => "Name",
      :city => "City",
      :state => "State",
      :zip_code => "Zip Code",
      :street_address => "Street Address",
      :phone_number => "Phone Number",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip Code/)
    rendered.should match(/Street Address/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Website/)
  end
end
