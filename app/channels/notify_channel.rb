class NotifyChannel < ApplicationCable::Channel
    def subscribed
        stream_from "notifs"
    end

    def unsubscribed
    end
end