require 'spec_helper'

describe "quotes/edit" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :bike_id => 1,
      :customer_id => ""
    ))
  end

  it "renders the edit quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quote_path(@quote), "post" do
      assert_select "input#quote_bike_id[name=?]", "quote[bike_id]"
      assert_select "input#quote_customer_id[name=?]", "quote[customer_id]"
    end
  end
end
