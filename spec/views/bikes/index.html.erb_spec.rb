require 'spec_helper'

describe "bikes/index" do
  before(:each) do
    assign(:bikes, [
      stub_model(Bike,
        :make => "Make",
        :model => "Model",
        :kind => "Kind",
        :msrp => 1.5,
        :current_price => 1.5
      ),
      stub_model(Bike,
        :make => "Make",
        :model => "Model",
        :kind => "Kind",
        :msrp => 1.5,
        :current_price => 1.5
      )
    ])
  end

  it "renders a list of bikes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
