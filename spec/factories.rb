FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    profile
  end

  factory :customer do
    sequence(:first_name)  { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    sequence(:type) { |n| "type #{n}"}
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
