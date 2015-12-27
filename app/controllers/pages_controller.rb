class PagesController < ApplicationController
  def home
    @recent_achievements = Achievement.all.last(10)
    @achievement_leaderboard_users = User.all.order(points: :desc).last(10)
  end
end
