class Bike < ActiveRecord::Base
	has_many :quotes
	has_one :customer, through: :quotes
	validates :year_manufactured, presence: true
  	validates :make, presence: true
  	validates :model, presence: true
  	validates :kind, presence: true
  	validates :msrp, presence: true
  	validates :current_price, presence: true
end
