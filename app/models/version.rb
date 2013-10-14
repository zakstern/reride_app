class Version < ActiveRecord::Base
	belongs_to :model
	belongs_to :year
	validates :model_id, presence: true
  	validates :year_id, presence: true
end
