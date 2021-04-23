module ApplicationHelper
    def to_datetime_string(datetime)
        "#{time_ago_in_words(datetime)} ago"
    end

    def owns_model?(model)
        current_user.id == model.user_id || current_user.admin
    end

    def owns_match?(match)
        current_user.id == match.user1_id || current_user.id == match.user2_id || current_user.admin
    end
end
