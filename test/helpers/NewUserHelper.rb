module NewUserHelper
    def new_user()
        user_f_name = Faker::Name.first_name
        user_l_name = Faker::Name.last_name
        user_email = "sarah@example.com"
        user_password = Faker::Internet.password(min_length: 8)
        post users_path, params: { 
            user: {
                first_name: user_f_name,
                last_name: user_l_name,
                email: user_email,
                password: user_password
            }  
        }
        return [user_email, user_password]
    end
end
