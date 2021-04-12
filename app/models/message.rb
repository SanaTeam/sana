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

    after_create do
        ApplicationController.helpers.dispatch_message(self[:user_id], self[:match_id], self[:content])
    end
end
