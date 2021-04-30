module NewReplyHelper
    def new_reply(sender_user_id, parent_post_id)
        post replies_path, params: { 
            reply: {
                content: Faker::GreekPhilosophers.quote,
                user_id: sender_user_id,
                post_id: parent_post_id
            }  
        }
    end
end