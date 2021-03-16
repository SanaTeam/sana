class ApplicationController < ActionController::Base
    
    include ApplicationHelper
    include SessionsHelper

    private
    def logged_in_user
        unless logged_in?
            store_location
            flash[:alert] = "Please log in."
            redirect_to login_url
        end
    end

end
