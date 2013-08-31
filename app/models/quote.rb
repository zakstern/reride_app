class Quote < ActiveRecord::Base
	belongs_to :customer
 	belongs_to :bike
end
