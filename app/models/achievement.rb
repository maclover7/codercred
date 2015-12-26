class Achievement < ActiveRecord::Base
  scope :community, -> { where(category: "community") }
  scope :content, -> { where(category: "content") }

  belongs_to :user

  def community?
    category == "community"
  end

  def content?
    category == "content"
  end
end
