module PostsHelper
    def owns_post?(post)
        current_user.id == post.user_id
    end

    def owns_post!(post)
        unless owns_post?(post)
            flash[:alert] = "You don't own this post!"
            redirect_to posts_path
        end
    end
end
