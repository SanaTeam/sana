class Match < ApplicationRecord
    validates :user1_id, presence: true
    validates :user2_id, presence: true
    has_many :messages

    def confirmed?
        self[:user1_confirmed] && self[:user2_confirmed]
    end

    def contains_user?(user)
        self[:user1_id] == user || self[:user2_id] == user
    end
end
