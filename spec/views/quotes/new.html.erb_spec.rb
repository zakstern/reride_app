require 'spec_helper'

describe "new quote page" do
  subject { page}

  describe "new quote" do
    before { visit new_quote_path }

    it { should have_content("Get a Quote") }
    it { should have_title("New Quote")}
  end

  describe "get a quote" do

    before { visit new_quote_path }

    let(:submit) { "Show Quote" }

    describe "with invalid information" do
      it "should not create a quote" do
        expect { click_button submit }.not_to change(Quote, :count)
      end
    end

    describe "with valid information" do
      before { valid_quote_params }

      it "should create a quote" do
        expect { click_button submit }.to change(Quote, :count).by(1)
      end
    end
  end
end
