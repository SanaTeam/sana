module NewUserHelper
    def new_user(user)
        post users_path, params: { 
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email,
            password: user.password
        }
        follow_redirect!
    end
end
