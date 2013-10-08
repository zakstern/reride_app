class Bike < ActiveRecord::Base
	has_many :quotes
	has_many :customers, through: :quotes
	validates :year_manufactured, presence: true
  	validates :make, presence: true
  	validates :model, presence: true
  	validates :make_id, presence: true
  	validates :model_id, presence: true

  	default_scope :order => "make ASC"
  	scope :unique_by_make, lambda { select(:make).uniq}
  	scope :unique_by_model, lambda { select(:model).uniq}
end
