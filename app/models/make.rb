class Make < ActiveRecord::Base
	has_many :models, dependent: :destroy
	belongs_to :bike
end
