class MessagesController < ApplicationController
    
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

    def destroy
        @message = Message.find(params[:id])
        @match = Match.find(@message.match_id)
        @message.destroy!
        flash[:notice] = "Your message was destroyed!"
        redirect_to @match
    end
end
