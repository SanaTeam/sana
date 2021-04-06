class MatchesController < ApplicationController
    before_action :logged_in!, only: [:show]

    def index
        @matches = Match.all
    end

    def create
        @match = Match.new(match_params)
        @match.save!
        flash[:notice] = "Your match was created!"
        redirect_to posts_path
    end


    def show
        @match = Match.find(params[:id])
        match_contains_user!(@match)
        match_confirmed!(@match)
    end

    private

    def match_params
        params.require(:match).permit(:post_id, :user1_id, :user2_id, :user1_confirmed)
    end 
end
