module ApplicationHelper
    def to_datetime_string(datetime)
        datetime.strftime("%m/%d/%Y %I:%M %p")
    end

    def owns_model?(model)
        current_user.id == model.user_id
    end

    def owns_match?(match)
        current_user.id == match.user1_id || current_user.id == match.user2_id
    end
end
