class RepliesController < ApplicationController
    include CableReady::Broadcaster
    def create
        @post = Post.find(params[:id])
        @reply = Reply.new(content: params[:content], to: params[:to], user_id: current_user.id, post_id: params[:id])
        if @reply.save
            flash[:notice] = "Your reply was created!"
        else
            flash[:alert] = @reply.errors.full_messages.join(", ")
        end
        redirect_to @post
    end

    def destroy
        @reply = Reply.find(params[:id])
        @post = Post.find(@reply.post_id)
        @reply.destroy!
        flash[:notice] = "Your reply was destroyed!"
        redirect_to @post
    end

    def new
    end

end
