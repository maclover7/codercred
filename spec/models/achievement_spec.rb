require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should belong_to(:user) }

  describe "#community scope" do
    it "includes correct achievement" do
      @achievement = FactoryGirl.create(:achievement, category: "community")

      expect(Achievement.all.community).to include(@achievement)
      expect(Achievement.all.community.count).to eq(1)
    end
  end

  describe "#content scope" do
    it "includes correct achievement" do
      @achievement = FactoryGirl.create(:achievement, category: "content")

      expect(Achievement.all.content).to include(@achievement)
      expect(Achievement.all.content.count).to eq(1)
    end
  end
end
