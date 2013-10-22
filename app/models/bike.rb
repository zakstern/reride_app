class Bike < ActiveRecord::Base
    has_one :make
    has_one :model
    has_one :year
    accepts_nested_attributes_for :make
    accepts_nested_attributes_for :model
    accepts_nested_attributes_for :year
    has_attached_file :side_picture, 
        :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
        :storage => :s3,
        :bucket => 'reride',
        :s3_credentials => {
            :access_key_id => 'AKIAJK5ZPDNLNNTKIRTQ',
            :secret_access_key => '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'
    }

    #Validations
    validates :make_id, presence: true
    validates :model_id, presence: true
    validates :year_id, presence: true
    
end
