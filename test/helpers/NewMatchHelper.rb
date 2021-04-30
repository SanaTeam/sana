module NewMatchHelper
    def new_match(parent_post_id, user_1_id, user_2_id)
        post matches_path, params: { 
            match: {
                post_id: parent_post_id,
                user1_id: user_1_id,
                user2_id: user_2_id,
                user1_confirmed: true,
                user2_confirmed: true
            }  
        }
    end
end
