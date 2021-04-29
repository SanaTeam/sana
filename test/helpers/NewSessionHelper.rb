module NewSessionHelper
    def new_session(user)
        post sessions_path, params: { 
            email: user.email,
            password: user.password
        }

        # follow_redirect!

    end
    

end
