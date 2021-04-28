module NewUserHelper
    def new_user(user)
        post users_path, params: { 
            user: {
                first_name: user.first_name,
                last_name: user.last_name,
                email: user.email,
                password: user.password
            }  
        }
        puts "request = #{request.url}"

        # follow_redirect!
    end
end
