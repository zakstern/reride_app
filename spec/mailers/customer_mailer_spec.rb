require "spec_helper"

describe CustomerMailer do
  describe "quote_confirmation" do
    let(:mail) { CustomerMailer.quote_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Quote confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
