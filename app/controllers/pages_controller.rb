class PagesController < ApplicationController
  def home
    @recent_achievements = Achievement.all.last(10)
  end
end
