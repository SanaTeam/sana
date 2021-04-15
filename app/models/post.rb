class Post < ApplicationRecord
    belongs_to :user
    has_many :replies
    paginates_per 10

    def contains_categories?(array_cat)
        a1 = Set.new self[:categories]
        a2 = Set.new array_cat
        a2.subset?(a1)
    end 

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
