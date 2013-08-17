class BikeShop < ActiveRecord::Base
	has_one :user, :as => :profile, :dependent => :destroy
	accepts_nested_attributes_for :user
	validates :name, presence: true, length: { maximum: 50 }
  	validates :city, presence: true, length: { maximum: 50 }
  	validates :state, presence: true
  	validates :zip_code, presence: true, length: { maximum: 5 }
  	validates :street_address, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100}
  	validates :phone_number, presence: true
  	validates :website, presence: true
end
