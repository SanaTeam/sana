module MatchesHelper
    def match_contains_user!(match)
        if !match.contains_user?(current_user.id)
            flash[:alert] = "You are not part of this match."
            redirect_to root_path
        end
    end

    def match_confirmed!(match)
        if !match.confirmed?
            flash[:alert] = "Your match hasn't yet been confirmed!"
            redirect_to root_path
        end
    end

    def dispatch_match(user_id, match_id)
        cable_ready["notifs"].dispatch_event(
            name: "notify",
            detail: {
                id: match_id,
                title: "",
                content: "",
                from_name: User.find(user_id).full_name,
                from_id: user_id,
                users: Match.find(match_id).participants,
                notif_type: "match"
            }
        )
        cable_ready.broadcast
    end
end
