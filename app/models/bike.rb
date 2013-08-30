class Bike < ActiveRecord::Base
	belongs_to :customers
	validates :year_manufactured, presence: true
  	validates :make, presence: true
  	validates :model, presence: true
  	validates :kind, presence: true
  	validates :msrp, presence: true
  	validates :current_price, presence: true
end
