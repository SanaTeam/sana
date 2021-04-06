class MessagesController < ApplicationController
    
    def create
        @match = Match.find(params[:id])
        @message = Message.new(content: params[:content], user_id: current_user.id, match_id: params[:id])
        if @message.save
            flash[:notice] = "Your message was created!"
        else
            flash[:alert] = @message.errors.full_messages.join(", ")
        end
        redirect_to @match
    end

    def destroy
        @message = Message.find(params[:id])
        @match = Match.find(@message.match_id)
        @message.destroy!
        flash[:notice] = "Your message was destroyed!"
        redirect_to @match
    end
end
