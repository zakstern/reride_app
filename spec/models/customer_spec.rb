require 'spec_helper'

describe Customer do

  before { @customer = Customer.new(first_name: "First", last_name: "Last", email: "example@example.com", type: "Reseller") }

  subject { @customer }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:type) }
  it { should respond_to(:quotes) }

  it { should be_valid }

  describe "when first name is not present" do
    before { @customer.first_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @customer.last_name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @customer.email = " " }
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @customer.first_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @customer.last_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @customer.email = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when type is too long" do
    before { @customer.type = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @customer.email = invalid_address
        expect(@customer).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @customer.email = valid_address
        expect(@customer).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      customer_with_same_email = @customer.dup
      customer_with_same_email.email = @customer.email.upcase
      customer_with_same_email.save
    end

    it { should_not be_valid }
  end
end
