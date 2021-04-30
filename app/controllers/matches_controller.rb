class MatchesController < ApplicationController
    before_action :logged_in!, only: [:show, :index]

    def index
    end

    def create
        @match = Match.new(match_params)
        if @match.save
            flash[:notice] = "You requested a match!"
            redirect_to posts_path
        else
            flash[:alert] = @match.errors.full_messages.join(", ")
            redirect_to @match
        end
    end

    def accept
        @match = Match.find(params[:id])
        match_contains_user!(@match)
        @match.update!(user1_confirmed: true, user2_confirmed: true)
        flash[:notice] = "You confirmed a match!"
        redirect_to @match
    end

    def destroy
        @match = Match.find(params[:id])
        match_contains_user!(@match)
        @match.destroy!
        flash[:notice] = "You closed a match!"
        redirect_to user_path(current_user.id)
    end

    def show
        @match = Match.find(params[:id])
        match_contains_user!(@match)
        if @match.contains_user?(current_user)
            match_confirmed!(@match)
        end
    end

    private

    def match_params
        params.require(:match).permit(:post_id, :user1_id, :user2_id, :user1_confirmed)
    end 
end
