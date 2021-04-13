module MessagesHelper
    include CableReady::Broadcaster

    def dispatch_message(user_id, match_id, content)
        cable_ready["notifs"].dispatch_event(
            name: "notify",
            detail: {
                id: match_id,
                title: "",
                content: content,
                from_name: User.find(user_id).full_name,
                from_id: user_id,
                users: Match.find(match_id).participants,
                notif_type: "message"
            }
        )
        cable_ready.broadcast
    end
end