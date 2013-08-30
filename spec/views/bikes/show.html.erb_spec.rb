require 'spec_helper'

describe "bikes/show" do
  before(:each) do
    @bike = assign(:bike, stub_model(Bike,
      :make => "Make",
      :model => "Model",
      :kind => "Kind",
      :msrp => 1.5,
      :current_price => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Make/)
    rendered.should match(/Model/)
    rendered.should match(/Kind/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
