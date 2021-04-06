class Post < ApplicationRecord
    belongs_to :user
    has_many :replies
    paginates_per 10

    validates :title, presence: true 
    validates :content, presence: true 
end
