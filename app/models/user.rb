class User < ApplicationRecord
    has_many :organizations
    has_many :posts
    has_many :messages
    has_one :profile
end
