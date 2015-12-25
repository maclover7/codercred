class UsersController < ApplicationController
  before_action :set_user

  def show
    @content_achievements = @user.achievements.all
    @community_achievements = @user.achievements.all
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
