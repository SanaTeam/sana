module NewUserHelper
    def new_user()
        post users_path, params: { 
            user: {
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: "sarah@example.com",
                password: Faker::Internet.password(min_length: 8)
            }  
        }

        # follow_redirect!
    end
end
