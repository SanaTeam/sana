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
      logout_route = current_user.oauth_id ? logout_url : root_url
      log_out
      reset_session
      flash[:notice] = "You successfully logged out."
      redirect_to logout_route
    end

    def logout_url
      request_params = {
        returnTo: root_url,
        client_id: ENV['AUTH0_CLIENT_ID']
      }
  
      URI::HTTPS.build(host: ENV['AUTH0_DOMAIN'], path: '/v2/logout', query: to_query(request_params)).to_s
    end
  
    def to_query(hash)
      hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
    end

end
