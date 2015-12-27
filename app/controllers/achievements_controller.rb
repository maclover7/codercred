class AchievementsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @achievement = current_user.achievements.create(achievements_params)
    if @achievement.save
      @achievement.add_points_to_user
      render json: {}, status: 201
    end
  end

  private

  def achievements_params
    params.require(:achievement).permit(:category, :description, :title)
  end
end
