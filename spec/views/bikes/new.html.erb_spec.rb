require 'spec_helper'

describe "bikes/new" do
  before(:each) do
    assign(:bike, stub_model(Bike,
      :make => "MyString",
      :model => "MyString",
      :kind => "MyString",
      :msrp => 1.5,
      :current_price => 1.5
    ).as_new_record)
  end

  it "renders new bike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bikes_path, "post" do
      assert_select "input#bike_make[name=?]", "bike[make]"
      assert_select "input#bike_model[name=?]", "bike[model]"
      assert_select "input#bike_kind[name=?]", "bike[kind]"
      assert_select "input#bike_msrp[name=?]", "bike[msrp]"
      assert_select "input#bike_current_price[name=?]", "bike[current_price]"
    end
  end
end
