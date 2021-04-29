module NewSessionHelper
    def new_session(user)
        puts sessions_path
        puts user.email
        puts user.password
        post sessions_path, params: { 
            email: user.email,
            password: user.password
            
        }

        puts request.path

        # follow_redirect!

    end
    

end
