class UserMailer < ActionMailer::Base
    default from: 'aaronportman@brandeis.edu'
    def password_reset(user)
        @user = user
        mail to: user.email, subject: "Password reset"  
    end
      
end