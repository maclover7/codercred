require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should belong_to(:user) }

  describe "#add_points_to_user" do
    context "community" do
      it "adds correct number of points" do
        @user = FactoryGirl.create(:user)
        @achievement = FactoryGirl.create(:achievement, category: "community")
        expect {
          @achievement.add_points_to_user
          @user.reload
        }.to change(@user, :points).by(2)
      end
    end

    context "content" do
      it "adds correct number of points" do
        @user = FactoryGirl.create(:user)
        @achievement = FactoryGirl.create(:achievement, category: "content")
        expect {
          @achievement.add_points_to_user
          @user.reload
        }.to change(@user, :points).by(1)
      end
    end

    describe "#community?" do
      it "returns true" do
        @achievement = FactoryGirl.create(:achievement, category: "community")
        expect(@achievement.community?).to eq(true)
      end
    end

    describe "#content?" do
      it "returns true" do
        @achievement = FactoryGirl.create(:achievement, category: "content")
        expect(@achievement.content?).to eq(true)
      end
    end
  end

  describe "scopes" do
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
end
