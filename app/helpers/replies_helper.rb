module RepliesHelper
    include CableReady::Broadcaster

    def dispatch_reply(user_id, post_id, content)
        post = Post.find(post_id)
        cable_ready["notifs"].dispatch_event(
            name: "notify",
            detail: {
                id: post_id,
                title: post.title,
                content: content,
                from_name: User.find(user_id).full_name,
                from_id: user_id,
                users: post.participants,
                notif_type: "reply"
            }
          )
          cable_ready.broadcast
    end
end
