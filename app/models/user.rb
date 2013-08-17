class User < ActiveRecord::Base
	#setting up the polymorphic relationship with Bike shops, resellers, and customers via profiles
	belongs_to :profile, :polymorphic => true
  
  before_save { self.email = email.downcase }
	has_secure_password
	validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, 
  		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end
