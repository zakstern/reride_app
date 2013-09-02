class Quote < ActiveRecord::Base
	belongs_to :customer
 	belongs_to :bike
 	accepts_nested_attributes_for :customer
 	accepts_nested_attributes_for :bike
 	validates :bike, presence: true #require bike info for a quote
end
