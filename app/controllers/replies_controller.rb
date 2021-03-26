class RepliesController < ApplicationController

    def create
        @reply = Reply.new(content: params[:content], to: params[:to], user_id: params[:user_id])
        @reply.save!
    end

    def destroy
        @reply = Reply.find(params[:id])
        @reply.destroy!
        flash[:notice] = "Your reply was destroyed!"
    end
end
