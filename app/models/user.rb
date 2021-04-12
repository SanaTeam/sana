class User < ApplicationRecord
    has_many :organizations
    has_many :posts
    has_many :messages
    has_secure_password

    validates :first_name, presence: true 
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }, allow_nil: true

end
