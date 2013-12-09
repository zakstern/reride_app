class Customer < ActiveRecord::Base
	# disable STI
  self.inheritance_column = :_type_disabled
  before_save { self.email = email.downcase }


  has_many :quotes, dependent: :destroy
  has_many :transactions, dependent: :destroy
  accepts_nested_attributes_for :quotes
	validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, 
  		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :phone_number, presence: true
end
