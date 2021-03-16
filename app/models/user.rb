class User < ApplicationRecord
    has_many :organizations
    has_many :posts
    has_many :messages
    has_one :profile
    has_secure_password

    # validation
    validates :first_name, presence: true 
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

end
