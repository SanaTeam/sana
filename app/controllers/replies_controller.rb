class RepliesController < ApplicationController

    def create
        @post = Post.find(params[:id])
        @reply = Reply.new(content: params[:content], to: params[:to], user_id: current_user.id, post_id: params[:id])
        @reply.save!
        redirect_to @post
    end

    def destroy
        @reply = Reply.find(params[:id])
        @reply.destroy!
        flash[:notice] = "Your reply was destroyed!"
        redirect_to replies_path
    end

    def new
    end

end
