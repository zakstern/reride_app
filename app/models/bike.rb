class Bike < ActiveRecord::Base
    belongs_to :make
    belongs_to :model
    belongs_to :year
    has_many :quotes
    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :model
    accepts_nested_attributes_for :year
    

    #Validations
    validates :make_id, presence: true
    validates :model_id, presence: true
    validates :year_id, presence: true
    
end
