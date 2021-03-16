class ApplicationController < ActionController::Base
    
    include ApplicationHelper
    include SessionsHelper

    private
    def logged_in!
        unless logged_in?
            store_location
            flash[:alert] = "Please log in."
            redirect_to new_session_path
        end
    end

end
