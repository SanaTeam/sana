class PostsController < ApplicationController
    before_action :logged_in!, only: [:new, :show, :edit, :destroy]

    def index
        @posts = Post.all
    end

    def new
    end

    def create
        @post = Post.new(title: params[:title], content: params[:content], user_id: current_user.id, pinned: params[:pinned], is_anonymous: params[:is_anonymous])
        @post.save!
        flash[:notice] = "Your post was created!"
        redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
        owns_post!(@post)
    end

    def update
        @post = Post.find(params[:id])
        post_params = params[:post]
        @post.update!(title: post_params[:title], content: post_params[:content], user_id: @post.user_id, pinned: post_params[:pinned], is_anonymous: post_params[:is_anonymous])
        flash[:notice] = "Your post was updated!"
        redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:id])
        owns_post!(@post)
        @post.destroy!
        flash[:notice] = "Your post was destroyed!"
        redirect_to posts_path
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find(@post.user_id)
    end
end
