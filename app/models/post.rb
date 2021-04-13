class Post < ApplicationRecord
    belongs_to :user
    has_many :replies
    paginates_per 10

    validates :title, presence: true 
    validates :content, presence: true 

    def participants 
        (self.replies.pluck(:user_id) + [self[:user_id]]).uniq
    end
end
