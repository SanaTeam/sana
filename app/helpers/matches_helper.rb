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
end
