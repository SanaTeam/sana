class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :content, presence: true 

    after_create do
        ApplicationController.helpers.dispatch_reply(self[:user_id], self[:post_id], self[:content])
    end
end
