class Make < ActiveRecord::Base
	has_many :models, dependent: :destroy
	has_many :bikes
end
