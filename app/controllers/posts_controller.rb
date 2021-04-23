class PostsController < ApplicationController
    before_action :logged_in!, only: [:index, :new, :show, :edit, :destroy]

    def index
        @has_category = nil
        @categories = ["Financial Literacy", "Transportation", "Productivity", "Mindfulness", "Healthy Habits", "Academics/Tutoring", "Language Learning", "Other"]
        if params[:clear_filters]
            @posts = Post.all
        else 
            search = params[:search].present? ? params[:search] : nil
            @posts = if search
                Post.search(search)
            else
                Post.all
            end
            if params[:help_status]
                @posts = @posts.where(is_request: params[:help_status])
            end 
            if params[:category]
                @has_category = params[:category]
            end 
            @posts = @posts.select{|post| post.contains_categories?(params[:category])}
            @posts = Post.where(id: @posts.pluck(:id))
        end 
        puts("these are the posts")
        puts @posts
        @posts = @posts.order(pinned: :desc, created_at: :desc).page(params[:page])
    end

    def search 
        @posts = Post.all
    end 

    def new
    end

    def create
        @post = Post.new(title: post_params[:title], content: post_params[:content], user_id: current_user.id, pinned: post_params[:pinned], is_anonymous: post_params[:is_anonymous], is_request: post_params[:is_request])
        if @post.save
            flash[:notice] = "Your post was created!"
            redirect_to @post
        else
            flash[:alert] = @post.errors.full_messages.join(", ")
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
        owns_post!(@post)
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(title: post_params[:title], content: post_params[:content], user_id: @post.user_id, pinned: post_params[:pinned], is_anonymous: post_params[:is_anonymous], is_request: post_params[:is_request])
            flash[:notice] = "Your post was updated!"
            redirect_to @post
        else
            flash[:alert] = @post.errors.full_messages.join(", ")
            render 'edit'
        end
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

    def post_params
        if params[:post]
            params[:post]
        else
            params
        end
    end
end
