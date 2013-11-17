source 'https://rubygems.org'
ruby '1.9.3'
#ruby-gemset=reride_app

gem 'rails', '4.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem "mechanize", "~> 2.7.2"
gem 'pg', '0.15.1'
gem "simple_form", "~> 3.0.0.rc"
gem 'jquery-turbolinks'
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '~> 1.5.7'
gem 'sass-rails', '4.0.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.0'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'railroady', '1.1.1'
end

group :test do
  gem "shoulda-matchers", github: "thoughtbot/shoulda-matchers" , branch: 'dp-rails-four' #To test model relationships simply
  gem 'selenium-webdriver', '2.0.0'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor'
end