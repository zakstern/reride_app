class Transaction < ActiveRecord::Base
	has_one :inspection
	belongs_to :quote
	belongs_to :bike_shop
	belongs_to :customer
	accepts_nested_attributes_for :inspection
end
