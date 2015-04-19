class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :fname, presence: true, length: { maximum: 63 }
	validates :lname, presence: true, length: { maximum: 63 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	has_many :stores
	has_many :api_keys
	has_secure_password
	validates :password, length: { minimum: 6 }
end
