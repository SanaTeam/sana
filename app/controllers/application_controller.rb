class ApplicationController < ActionController::Base
    
    include ApplicationHelper
    include SessionsHelper
    include MatchesHelper
    include PostsHelper

end
