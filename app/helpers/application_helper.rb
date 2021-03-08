module ApplicationHelper
    def to_datetime_string(datetime)
        datetime.strftime("%m/%d/%Y %H:%M %p")
    end
end
