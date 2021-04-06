class Message < ApplicationRecord
    validates :user_id, presence: true
    validate :user_in_match?
    validates :content, presence: true 
    belongs_to :match

    def user_in_match?
        if !Match.find(self[:match_id]).contains_user?(self[:user_id])
            errors.add(:user_id, "Invalid user id")
        end
    end
end
