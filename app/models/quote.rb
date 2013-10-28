class Quote < ActiveRecord::Base
	belongs_to :customer
	belongs_to :bike
 	has_attached_file :side_picture, 
        :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
        :storage => :s3,
        :bucket => 'reride',
        :s3_credentials => {
            :access_key_id => 'AKIAJK5ZPDNLNNTKIRTQ',
            :secret_access_key => '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'
    }

    has_attached_file :front_picture, 
        :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
        :storage => :s3,
        :bucket => 'reride',
        :s3_credentials => {
            :access_key_id => 'AKIAJK5ZPDNLNNTKIRTQ',
            :secret_access_key => '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'
    }
end
