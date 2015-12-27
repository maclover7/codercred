class Achievement < ActiveRecord::Base
  scope :community, -> { where(category: "community") }
  scope :content, -> { where(category: "content") }

  belongs_to :user

  def add_points_to_user
    if community?
      user.points += 2
    else
      user.points += 1
    end
    user.save
  end

  def community?
    category == "community"
  end

  def content?
    category == "content"
  end
end
