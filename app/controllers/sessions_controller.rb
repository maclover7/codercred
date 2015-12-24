class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user = User.where(email: auth_hash['info']['email']).any?

    if user
      # user already exists
      user = User.find_by(email: auth_hash['info']['email'])
      session[:user_id] = user.id
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

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out successfully.'
    redirect_to root_url
  end
end
