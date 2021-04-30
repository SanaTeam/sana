module NewSessionHelper
    def new_session(user_email, user_password)
        post sessions_path, params: { 
            session: {
                email: user_email,
                password: user_password
            }
        }
    end
end
