class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def match
        flash[:notice] = "Match to be implemented soon!"
        redirect_to posts_path
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find(@post.user_id)
    end
end
