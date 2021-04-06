class SessionsController < ApplicationController
    def new
    end
  
    def create
      session_params = params[:session]
      user = User.find_by(email: session_params[:email].downcase)
      if user && user.authenticate(session_params[:password])
        log_in user
        flash[:notice] = "You successfully logged in!"
        redirect_back_or user
      else
        flash.now[:alert] = 'Invalid email/password combination.'
        render 'new'
      end
    end
  
    def destroy
      log_out
      flash[:notice] = "You successfully logged out."
      redirect_to root_url
    end

end
