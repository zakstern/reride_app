class Bike < ActiveRecord::Base
    has_one :make
    has_one :model
    has_one :year
    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :model
    accepts_nested_attributes_for :year
    

    #Validations
    validates :make_id, presence: true
    validates :model_id, presence: true
    validates :year_id, presence: true
    
end
