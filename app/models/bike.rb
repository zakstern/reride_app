class Bike < ActiveRecord::Base
	has_many :quotes
	has_many :customers, through: :quotes
  has_one :make
  has_one :model
  has_one :year

  default_scope :order => "make ASC"
  scope :unique_by_make, lambda { select(:make).uniq}
  scope :unique_by_model, lambda { select(:model).uniq}
end
