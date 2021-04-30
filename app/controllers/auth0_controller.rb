class Auth0Controller < ApplicationController
  def callback
    auth_params = request.env['omniauth.auth']
    picture = auth_params['extra']['raw_info']['picture']
    oauth_id = auth_params['uid']
    name_split = auth_params['info']['name'].split
    first_name = name_split[0]
    last_name = name_split[1..-1].join(' ')
    user = User.find_by(oauth_id: oauth_id)
    if user
      flash[:notice] = "You successfully logged in!"
    else
      user = User.create!(first_name: first_name, last_name: last_name, email: "", oauth_id: oauth_id, password: oauth_id, password_confirmation: oauth_id)
      flash[:notice] = "You successfully signed up!"
    end
    user.update(picture: picture)
    log_in user
    redirect_back_or user
  end

  def failure
  end
end
