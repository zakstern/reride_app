class Model < ActiveRecord::Base
	belongs_to :make
	belongs_to :bike
	has_many :versions, foreign_key: "model_id", dependent: :destroy
	has_many :years, through: :versions
	accepts_nested_attributes_for :years

	def version?(year)
    	versions.find_by(year_id: year.id)
  	end

  	def version!(year)
    	versions.create!(year_id: year.id)
  	end
end
