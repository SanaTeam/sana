class ApplicationController < ActionController::Base
    
    include ApplicationHelper
    include SessionsHelper
    include MatchesHelper
    include MessagesHelper
    include PostsHelper
    include RepliesHelper
    
end
