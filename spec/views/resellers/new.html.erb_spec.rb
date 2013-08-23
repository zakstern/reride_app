require 'spec_helper'

describe "resellers/new" do
  before(:each) do
    assign(:reseller, stub_model(Reseller,
      :name => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString",
      :street_address => "MyString",
      :phone_number => "MyString",
      :website => "MyString"
    ).as_new_record)
  end

  it "renders new reseller form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resellers_path, "post" do
      assert_select "input#reseller_name[name=?]", "reseller[name]"
      assert_select "input#reseller_city[name=?]", "reseller[city]"
      assert_select "input#reseller_state[name=?]", "reseller[state]"
      assert_select "input#reseller_zip_code[name=?]", "reseller[zip_code]"
      assert_select "input#reseller_street_address[name=?]", "reseller[street_address]"
      assert_select "input#reseller_phone_number[name=?]", "reseller[phone_number]"
      assert_select "input#reseller_website[name=?]", "reseller[website]"
    end
  end
end
