module NewSessionHelper
    def new_session(user)
        post sessions_path, params: { 
            session: {
                email: user.email,
                password: user.password
            }
        }

        # follow_redirect!

    end
    

end
