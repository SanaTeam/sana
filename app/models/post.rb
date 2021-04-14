class Post < ApplicationRecord
    belongs_to :user
    has_many :replies
    paginates_per 10

    searchkick

    def search_data
        {
            title: title,
            content: content
        }
    end 

    Post.reindex

    validates :title, presence: true 
    validates :content, presence: true 
end
