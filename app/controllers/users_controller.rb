class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user
  before_action :correct_user, only: [:edit, :update]

  def edit
  end

  def show
    @community_achievements = @user.achievements.community.all
    @content_achievements = @user.achievements.content.all
  end

  def update
    @user.update(user_params)

    if @user.save
      flash[:success] = "Successfully updated."
      redirect_to root_path
    end
  end

  private

  def correct_user
    unless current_user.id == @user.id
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find_by!(github_username: params[:github_username])
  end

  def user_params
    params.require(:user).permit(:description, :github_username, :facebook_username, :twitter_username)
  end
end
