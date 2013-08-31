require 'spec_helper'

describe "quotes/new" do
  before(:each) do
    assign(:quote, stub_model(Quote,
      :bike_id => 1,
      :customer_id => ""
    ).as_new_record)
  end

  it "renders new quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quotes_path, "post" do
      assert_select "input#quote_bike_id[name=?]", "quote[bike_id]"
      assert_select "input#quote_customer_id[name=?]", "quote[customer_id]"
    end
  end
end
