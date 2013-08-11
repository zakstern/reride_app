class Customer < ActiveRecord::Base
	# disable STI
  	self.inheritance_column = :_type_disabled
  	before_save { self.email = email.downcase }

	validates :first_name, presence: true, length: { maximum: 50 }
  	validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 50 }, 
  		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  	validates :type, presence: true, length: { maximum: 50 }, :inclusion => %w(Bike_Shop Reseller Customer)
end
