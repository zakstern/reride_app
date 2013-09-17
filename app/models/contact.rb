class Contact < ActiveRecord::Base
	RELATIONSHIP_CHOICES = { 
	    customer: "Customer",
	    bike_shop: "Bike Shop",
	    reseller: "Reseller"
	}

	validates :potential_relationship, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 50 }, 
  		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
