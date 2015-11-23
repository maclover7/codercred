class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    if User.where(email: auth_hash['info']['email']).any?
      # user already exists
      flash[:success] = 'Logged in successfully.'
      redirect_to root_url
    else
      # user needs to be created
      user = User.create_from_auth_hash(auth_hash)
      session[:user_id] = user.id

      flash[:success] = 'Logged in successfully.'
      redirect_to root_url
    end
  end
end
