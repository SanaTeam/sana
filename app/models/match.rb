class Match < ApplicationRecord
    validates :user1_id, presence: true
    validates :user2_id, presence: true
    validate :no_self_matching
    has_many :messages

    def confirmed?
        self[:user1_confirmed] && self[:user2_confirmed]
    end

    def participants
        [self[:user1_id], self[:user2_id]]
    end

    def contains_user?(user)
        self[:user1_id] == user || self[:user2_id] == user
    end

    def no_self_matching
        if self[:user1_id] == self[:user2_id]
            errors.add(:base, "You can't match with yourself!")
        end
    end

    def matches_for_post(postid)
        post = Post.find(id: postid)
        posts = Post.all.where(is_request: !post.is_request)
        
    end 

    after_create do
        ApplicationController.helpers.dispatch_match(self[:user1_id], self[:id])
    end
end
