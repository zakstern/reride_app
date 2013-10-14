class Model < ActiveRecord::Base
	belongs_to :make
	has_many :years, dependent: :destroy
	accepts_nested_attributes_for :years
end
