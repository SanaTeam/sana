class MessagesController < ApplicationController

    def create
        @message = Message.new(content: params[:content], to: params[:to], user_id: params[:user_id])
        @message.save!
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy!
        flash[:notice] = "Your message was destroyed!"
    end
end
