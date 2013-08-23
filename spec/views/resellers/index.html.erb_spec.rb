require 'spec_helper'

describe "resellers/index" do
  before(:each) do
    assign(:resellers, [
      stub_model(Reseller,
        :name => "Name",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :street_address => "Street Address",
        :phone_number => "Phone Number",
        :website => "Website"
      ),
      stub_model(Reseller,
        :name => "Name",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :street_address => "Street Address",
        :phone_number => "Phone Number",
        :website => "Website"
      )
    ])
  end

  it "renders a list of resellers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
