class RepliesController < ApplicationController
    include CableReady::Broadcaster

    def index
        redirect_to posts_url
    end
    def create
        puts reply_params.inspect()
        @post = Post.find(reply_params[:post_id].to_i)
        @reply = Reply.new(content: reply_params[:content], to: reply_params[:to], user_id: current_user.id, post_id: @post.id)
        if @reply.save
            flash[:notice] = "Your reply was created!"
        else
            flash[:alert] = @reply.errors.full_messages.join(", ")
        end
        redirect_to posts_url
    end

    def destroy
        @reply = Reply.find(reply_params[:id])
        @reply.destroy!
        flash[:notice] = "Your reply was destroyed!"
        redirect_to posts_url
    end

    def new
        redirect_to posts_url
    end

    def reply_params
        params[:reply] ? params[:reply] : params
    end

end
