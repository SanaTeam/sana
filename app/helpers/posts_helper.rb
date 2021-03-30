module PostsHelper

    def owns_post!(post)
        unless owns_model?(post)
            flash[:alert] = "You don't own this post!"
            redirect_to posts_path
        end
    end
end
