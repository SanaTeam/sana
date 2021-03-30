module ApplicationHelper
    def to_datetime_string(datetime)
        datetime.strftime("%m/%d/%Y %H:%M %p")
    end

    def owns_model?(model)
        current_user.id == model.user_id
    end
end
