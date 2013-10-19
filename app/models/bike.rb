class Bike < ActiveRecord::Base
    has_one :make
    has_one :model
    has_one :year
    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :model
    accepts_nested_attributes_for :year
    has_attached_file :side_picture
end
