module NewPostHelper
    def new_post(post_title, org_id)
        post posts_path, params: { 
            post: {
                title: post_title,
                content: Faker::GreekPhilosophers.quote,
                pinned: [true, false].sample,
                is_anonymous: [true, false].sample,
                organization_id: org_id,
                is_request: [true, false].sample
            }  
        }
    end
end
