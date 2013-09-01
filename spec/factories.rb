FactoryGirl.define do
  
  factory :customer do
    sequence(:first_name)  { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    sequence(:type) { |n| "type #{n}"}
  end

  factory :reseller_user, class: "User" do
    association :profile, factory: :reseller
    sequence(:first_name)  { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :bike_shop_user, class: "User" do
    association :profile, factory: :bike_shop
    sequence(:first_name)  { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :bike_shop do
  	name "Example Store"
    city "Santa Monica"
    state "CA"
    zip_code "90405"
    sequence(:street_address)  { |j| "Street #{j}" }
    phone_number "5714387892"
    website "www.bikeshop.com"
  end

  factory :bike do
    year_manufactured "2013-08-29"
    make "Example Make"
    model "Example Model"
    kind "Road"
    msrp 3000.5
    current_price 2000.5
  end

  factory :reseller do
    name "Example Reseller"
    city "Santa Monica"
    state "CA"
    zip_code "90405"
    sequence(:street_address)  { |j| "Street #{j}" }
    phone_number "5714387892"
    website "www.bikeshop.com"
  end

end
