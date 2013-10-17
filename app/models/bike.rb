class Bike < ActiveRecord::Base
	has_many :quotes
	has_many :customers, through: :quotes
    has_one :make
    has_one :model
    has_one :year
    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :model
    accepts_nested_attributes_for :year

    has_attached_file :side_picture
end
