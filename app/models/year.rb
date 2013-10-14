class Year < ActiveRecord::Base
	belongs_to :model
	validates :year_value, presence: true, uniqueness: { case_sensitive: false }
end
