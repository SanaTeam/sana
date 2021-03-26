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

    def create
        @match = Match.find(params[:id])
        @message = Message.new(content: params[:content], user_id: current_user.id, match_id: params[:id])
        if @message.save
            flash[:notice] = "Your message was created!"
            redirect_to @match
        else
            flash[:alert] = @message.errors.full_messages.join(", ")
            render 'new'
        end
    end
end
