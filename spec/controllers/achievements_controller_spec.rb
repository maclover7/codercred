require 'rails_helper'

RSpec.describe AchievementsController, type: :controller do
  describe "#create" do
    context "logged in user" do
      before do
        # Log in user
        @user = FactoryGirl.create(:user)
        session[:user_id] = @user.id
      end

      it "responds with HTTP 201" do
        post :create, achievement: FactoryGirl.attributes_for(:achievement)
        expect(response.status).to eq(201)
      end

      it "creates a new Achievement" do
        expect {
          post :create, achievement: FactoryGirl.attributes_for(:achievement)
        }.to change(Achievement, :count).by(1)
      end
    end

    context "no logged in user" do
      it "does not create a new Achievement" do
        expect {
          post :create, achievement: FactoryGirl.attributes_for(:achievement)
        }.to change(Achievement, :count).by(0)
      end
    end
  end
end
