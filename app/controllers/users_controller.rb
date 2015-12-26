class UsersController < ApplicationController
  before_action :set_user

  def show
    @community_achievements = @user.achievements.community.all
    @content_achievements = @user.achievements.content.all
  end

  private

  def set_user
    @user = User.find_by!(username: params[:username])
  end
end
