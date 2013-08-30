require 'spec_helper'

describe "bikes/edit" do
  before(:each) do
    @bike = assign(:bike, stub_model(Bike,
      :make => "MyString",
      :model => "MyString",
      :kind => "MyString",
      :msrp => 1.5,
      :current_price => 1.5
    ))
  end

  it "renders the edit bike form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bike_path(@bike), "post" do
      assert_select "input#bike_make[name=?]", "bike[make]"
      assert_select "input#bike_model[name=?]", "bike[model]"
      assert_select "input#bike_kind[name=?]", "bike[kind]"
      assert_select "input#bike_msrp[name=?]", "bike[msrp]"
      assert_select "input#bike_current_price[name=?]", "bike[current_price]"
    end
  end
end
