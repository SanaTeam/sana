class Post < ApplicationRecord
    belongs_to :user
    has_many :replies
    paginates_per 10

    searchkick

    Post.reindex

    validates :title, presence: true 
    validates :content, presence: true 
end
