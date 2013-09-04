class Bike < ActiveRecord::Base
	has_many :quotes
	has_many :customers, through: :quotes
	validates :year_manufactured, presence: true
  	validates :make, presence: true
  	validates :model, presence: true
  	validates :make_id, presence: true
  	validates :model_id, presence: true
end
