class Year < ActiveRecord::Base
	belongs_to :model
	belongs_to :bike
	validates :year_value, presence: true, uniqueness: { case_sensitive: false }
end
