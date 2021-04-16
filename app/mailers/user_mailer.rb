class UserMailer < ApplicationMailer
    
    def forgot_password(user)
        @user = user
        @greeting = "Hi"
        
        mail from: 'sanadeveloperteam@gmail.com', to: user.email, subject: 'Reset password instructions'
    end
end
