module MessagesHelper
    include CableReady::Broadcaster

    def dispatch_message(user_id, match_id, content)
        cable_ready["notifs"].dispatch_event(
            name: "notify",
            detail: {
                id: match_id,
                title: "match",
                content: content,
                from_name: User.find(user_id).first_name,
                from_id: user_id,
                users: Match.find(match_id).messages.pluck(:user_id).uniq,
                is_match: true
            }
        )
        cable_ready.broadcast
    end
end