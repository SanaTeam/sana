class MatchesController < ApplicationController
    before_action :logged_in!, only: [:show]

    def index
        flash[:notice] = "Match to be implemented soon!"
        redirect_to posts_path
    end

    def show
        @match = Match.find(params[:id])
        match_contains_user!(@match)
    end
end
